import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nfctest/theme.dart';

import 'custom_button.dart';
import 'form_group.dart';
import 'page_loader.dart';
import 'select_box.dart';
import 'utils.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC Tap to Pay',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NFC Tap to Pay'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _nfcsupp = false;

  @override
  void initState() {
    // var pinblock = EmvUtils.genPinBlock('1995', '5399237040387835');
    // var encpinblock = EmvUtils.genTripleDESEncPinBlock(
    //     pinblock, 'f8141fa4-5905-4493-95ce-cc365d65');
    // print(pinblock);
    // print(encpinblock);
    () async {
      var res = await http.post(
          Uri.parse('http://aarapi.bellmonie.com/api/v1/auth/terminal-sign'),
          body: json.encode({'terminalId': '2035BOU6'}),
          headers: {'Content-Type': 'application/json'});
      setState(() {
        try {
          _sessionId = json.decode(res.body)['data']['session_id'];
        } catch (e) {}
        print(_sessionId);
      });
    }();
    setState(() {
      _fields['account_type']['ctrl'].text = 'SAVINGS';
    });
    NfcManager.instance.isAvailable().then((av) {
      setState(() {
        _nfcsupp = av;
      });
    });
    super.initState();
  }

  void _tagRead(amount, {onDone}) {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      // try {
      Uint8List com = Uint8List.fromList([
        0x00,
        0xA4,
        0x04,
        0x00,
        utf8.encode('2PAY.SYS.DDF01').length,
        ...utf8.encode('2PAY.SYS.DDF01'),
        0x00,
      ]);
      var commHex = EmvUtils.bytesToHex([
        0x00,
        0xA4,
        0x04,
        0x00,
        utf8.encode('2PAY.SYS.DDF01').length,
        ...utf8.encode('2PAY.SYS.DDF01'),
        0x00,
      ]);
      records.add(TextFormField(
        initialValue: json.encode(commHex),
      ));

      IsoDep? isodep = IsoDep.from(tag);
      // NdefMessage? ndef = await Ndef.from(tag)?.read();
      // ndef?.records.first.identifier;
      var totalDecoded = [];
      Uint8List? res = await isodep?.transceive(data: com);
      // print(res);
      if (res != null) {
        records.add(TextFormField(
          initialValue: json.encode(EmvUtils.bytesToHex(res)),
        ));
        var dres = EmvUtils.decode([...res].sublist(0, res.length - 2));
        totalDecoded.addAll(dres);
        var aidobj = dres.firstWhere((c) => c['tag'] == '4F');
        var aid = aidobj['rawValue'];
        var aidres = await isodep?.transceive(
            data: Uint8List.fromList([
          0x00,
          0xA4,
          0x04,
          0x00,
          EmvUtils.hexToBytes(aid).length,
          ...EmvUtils.hexToBytes(aid),
          0x00
        ]));
        records.add(TextFormField(
          initialValue: json.encode(EmvUtils.bytesToHex([
            0x00,
            0xA4,
            0x04,
            0x00,
            EmvUtils.hexToBytes(aid).length,
            ...EmvUtils.hexToBytes(aid),
            0x00
          ])),
        ));
        if (aidres != null) {
          records.add(TextFormField(
            initialValue: json.encode(EmvUtils.bytesToHex(aidres)),
          ));
          var daidres =
              EmvUtils.decode([...aidres].sublist(0, aidres.length - 2));
          totalDecoded.addAll(daidres);
          Map pdol =
              daidres.firstWhere((p) => p['tag'] == '9F38', orElse: () => {});
          var pdolres;
          if (pdol.isEmpty) {
            pdolres = await isodep?.transceive(
                data: Uint8List.fromList(
                    [0x80, 0xa8, 0x00, 0x00, 0x02, 0x83, 0x00, 0x00]));
            records.add(TextFormField(
              initialValue: json.encode(EmvUtils.bytesToHex(
                  [0x80, 0xa8, 0x00, 0x00, 0x02, 0x83, 0x00, 0x00])),
            ));
          } else {
            var dcom =
                EmvUtils.genPDOLCommand(pdol['rawValue'], double.parse(amount));
            var com = dcom['gpoCommandList'];
            totalDecoded.addAll(dcom['iccData']);
            pdolres = await isodep?.transceive(
                data: Uint8List.fromList(
                    [0x80, 0xa8, 0x00, 0x00, com.length, ...com, 0x00]));
          }
          if (pdolres != null) {
            print(pdolres);
            records.add(TextFormField(
              initialValue: json.encode(EmvUtils.bytesToHex(pdolres)),
            ));
            var dpdolres =
                EmvUtils.decode([...pdolres].sublist(0, pdolres.length - 2));
            totalDecoded.addAll(dpdolres);
            String afl =
                dpdolres.firstWhere((d) => d['tag'] == '94')['rawValue'];
            print(afl);
            for (int i = 0; i < afl.length; i += 8) {
              var eafl = afl.substring(i, i + 8);
              print(eafl.substring(0, 2));
              var sfi = (int.parse('0x${eafl.substring(0, 2)}') >> 3) << 3 | 4;
              var rec1 = int.parse('0x${eafl.substring(2, 4)}');
              var recl = int.parse('0x${eafl.substring(4, 6)}');
              for (int j = rec1; j <= recl; j++) {
                Uint8List? recRes = await isodep?.transceive(
                    data: Uint8List.fromList([
                  0x00,
                  0xB2,
                  j,
                  sfi,
                  0,
                ]));
                records.add(TextFormField(
                    initialValue: json.encode(EmvUtils.bytesToHex([
                  0x00,
                  0xB2,
                  j,
                  sfi,
                  0,
                ]))));
                if (recRes != null) {
                  var dtoParse = EmvUtils.decode(
                      [...recRes].sublist(0, recRes.length - 2));
                  totalDecoded.addAll(dtoParse);
                }
              }
            }
            if (pdol.isEmpty) {
              var cdol = totalDecoded.firstWhere((t) => t['tag'] == '8C',
                  orElse: () => {})['rawValue'];
              print(cdol);

              var dcom = EmvUtils.genCDOLCommand(cdol, double.parse(amount));
              // } else {
              //   cdol = totalDecoded
              //       .firstWhere((t) => t['tag'] == '9F49')['rawValue'];
              //   dcom = EmvUtils.genDDOLCommand(cdol, double.parse(amount));
              // }
              var com = dcom['commandList'];
              print(dcom);
              totalDecoded.addAll(dcom['iccData']);
              var cdolres = await isodep?.transceive(
                  data: Uint8List.fromList(
                      [0x80, 0xae, 0x00, 0x00, com.length, ...com, 0x00]));
              print(cdolres);
              print([0x80, 0xae, 0x00, 0x00, com.length, ...com, 0x00]);
              setState(() {
                records.add(TextFormField(
                    initialValue: json.encode(EmvUtils.bytesToHex(
                        [0x80, 0xae, 0x00, 0x00, com.length, ...com, 0x00]))));
              });
              if (cdolres != null) {
                var dcdolres = EmvUtils.decode(
                    [...cdolres].sublist(0, cdolres.length - 2));
                totalDecoded.addAll(dcdolres);
              }
            }
            var iccData = EmvUtils.genICCData(totalDecoded);
            setState(() {
              records.add(TextFormField(initialValue: iccData));
            });
          }
        }
      }
      var iccData = EmvUtils.genICCData(totalDecoded);
      print(iccData);
      var track2D =
          totalDecoded.firstWhere((t) => t['tag'] == '57')['rawValue'];
      var pan = track2D.split('d')[0];
      var expiry = track2D.split('d')[1].substring(0, 6);
      onDone({
        'icc_data': iccData,
        'pan': pan,
        'expiry_date': expiry,
        'track2_data': track2D.toUpperCase(),
        'all_info': EmvUtils.simplifyTotalDecoded(totalDecoded),
      });
      // print('done');
      await NfcManager.instance.stopSession();
      // } catch (e) {
      //   print(e);
      //   await NfcManager.instance.stopSession();
      //   _tagRead(amount, onDone: onDone);
      // }
    });
  }

  List<Widget> records = [];
  final Map _data = {
    'terminal_id': '2035BOU6',
    'account_type': 'SAVINGS',
    'sequence_number': '001',
  };

  String _sessionId = '';

  final Map _pdata = {};

  final Map _fields = {
    'amount': {
      'focus': FocusNode(),
      'tapped': false,
      'touched': false,
      'valid': false,
      'ctrl': TextEditingController(),
    },
    'account_type': {
      'focus': FocusNode(),
      'tapped': false,
      'touched': false,
      'valid': true,
      'ctrl': TextEditingController(),
    },
  };
  final Map _pfields = {
    'pin': {
      'focus': FocusNode(),
      'tapped': false,
      'touched': false,
      'valid': false,
      'ctrl': TextEditingController(),
    },
  };

  final Map _errors = {};

  bool _validForm = false;
  bool _validPin = false;
  bool _validate(field, {valFunc}) {
    if (valFunc != null) {
      return valFunc();
    }
    if (_data[field] == null || _data[field].isEmpty) {
      setState(() {
        _errors[field] = 'This field is required!';
      });
      return false;
    }
    setState(() {
      _errors[field] = '';
    });
    return true;
  }

  bool _pvalidate(field, {valFunc}) {
    if (valFunc != null) {
      return valFunc();
    }
    if (_pdata[field] == null || _pdata[field].isEmpty) {
      setState(() {
        _errors[field] = 'This field is required!';
      });
      return false;
    }
    setState(() {
      _errors[field] = '';
    });
    return true;
  }

  String _curSel = '';
  Map _closeFunc = {};

  bool _scanning = false;
  bool _enterPin = false;
  bool _submitting = false;

  _submit() {
    setState(() {
      _scanning = true;
    });
    _tagRead(_data['amount'], onDone: (data) {
      _data['pan'] = data['pan'];
      _data['card_expiry_date'] = data['expiry_date'].substring(0, 4);
      _data['icc_data'] = data['icc_data'];
      _data['track2_data'] = data['track2_data'];
      setState(() {
        _scanning = false;
        _enterPin = true;
      });
    });
  }

  _pay() async {
    setState(() {
      _submitting = true;
    });
    var pinblock = EmvUtils.genPinBlock(_pdata['pin'], _data['pan']);
    var encpinblock = EmvUtils.genTripleDESEncPinBlock(pinblock, _sessionId);
    _data['pin_block'] = encpinblock;
    var res = await http.post(
      Uri.parse('http://aarapi.bellmonie.com/api/v1/cashout/new'),
      body: json.encode(_data),
      headers: {
        'session-id': _sessionId,
        'Content-Type': 'application/json',
      },
    );
    print(_data);
    var resd = json.decode(res.body);
    print(resd);
    setState(() {
      _submitting = false;
    });
    // if (json.decode(res.body)['success']) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(resd['success'] ? 'Success' : 'Error'),
        content: Text(resd['success']
            ? 'Payment was processed successfully'
            : resd['message']),
      ),
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    var res =
        _fields.keys.firstWhere((e) => !_fields[e]['valid'], orElse: () => '');
    setState(() {
      if (res.isEmpty) {
        _validForm = true;
      } else {
        _validForm = false;
      }
    });
    amntValidn() {
      if (_data['amount'] == null || _data['amount'].isEmpty) {
        setState(() {
          _errors['amount'] = 'This field is required';
        });
        return false;
      } else if (double.parse(_data['amount']) < 50) {
        setState(() {
          _errors['amount'] = 'Minimum amount is 50';
        });
        return false;
      }
      setState(() {
        _errors['amount'] = '';
      });
      return true;
    }

    _fields.forEach((k, v) {
      if (!v['focus'].hasListeners) {
        try {
          v['focus'].addListener(() {
            if (v['focus'].hasFocus) {
              v['tapped'] = true;
            } else if (!v['focus'].hasFocus && v['tapped']) {
              v['touched'] = true;
              v['valid'] = _validate(
                k,
                valFunc: k == 'amount' ? amntValidn : null,
              );
            }
            setState(() {});
          });
        } catch (e) {}
      }
    });
    var pres = _pfields.keys
        .firstWhere((e) => !_pfields[e]['valid'], orElse: () => '');
    setState(() {
      if (pres.isEmpty) {
        _validPin = true;
      } else {
        _validPin = false;
      }
    });
    pinValidn() {
      if (_pdata['pin'] == null ||
          _pdata['pin'].isEmpty ||
          _pdata['pin'].length != 4) {
        // setState(() {
        //   _errors['amount'] = 'This field is required';
        // });
        return false;
      }
      // _errors['amount'] = '';
      return true;
    }

    _pfields.forEach((k, v) {
      if (!v['focus'].hasListeners) {
        try {
          v['focus'].addListener(() {
            if (v['focus'].hasFocus) {
              v['tapped'] = true;
            } else if (!v['focus'].hasFocus && v['tapped']) {
              v['touched'] = true;
              v['valid'] = _validate(
                k,
                valFunc: k == 'pin' ? pinValidn : null,
              );
            }
            setState(() {});
          });
        } catch (e) {}
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppTheme.appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: _scanning
            ? const PageLoader('Place your card behind your phone to scan')
            : Column(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: _enterPin
                    ? [
                        FormGroup(
                          focusNode: _pfields['pin']['focus'],
                          controller: _pfields['pin']['ctrl'],
                          hint: 'Enter PIN',
                          keybType: TextInputType.number,
                          isPassword: true,
                          onChanged: (val) {
                            setState(() {
                              _pdata['pin'] = val;
                              _pfields['pin']['valid'] = _validate(
                                'pin',
                                valFunc: pinValidn,
                              );
                            });
                          },
                        ),
                        CustomButton(
                          text: 'Pay Now',
                          onClick: _pay,
                          disabled: !_validPin,
                          isLoading: _submitting,
                        ),
                      ]
                    : [
                        FormGroup(
                          focusNode: _fields['amount']['focus'],
                          controller: _fields['amount']['ctrl'],
                          hint: 'Enter Amount',
                          errMsg: _errors['amount'],
                          keybType: TextInputType.number,
                          onChanged: (val) {
                            _data['amount'] = val;
                            _fields['amount']['valid'] = _validate(
                              'amount',
                              valFunc: amntValidn,
                            );
                          },
                        ),
                        SelectBox(
                          options: const [
                            {'txt': 'SAVINGS', 'val': 'SAVINGS'},
                            {'txt': 'CURRENT', 'val': 'CURRENT'},
                          ],
                          controller: _fields['account_type']['ctrl'],
                          focusNode: _fields['account_type']['focus'],
                          onSelect: (val) {
                            setState(() {
                              _data['account_type'] = val['val'];
                              _fields['account_type']['ctrl'].text = val['txt'];
                              _fields['account_type']['valid'] = true;
                            });
                          },
                          onTap: (f) {
                            setState(() {
                              _curSel = 'account_type';
                            });
                            _closeFunc['account_type'] = f;
                          },
                          onClose: () {
                            setState(() {
                              _curSel = '';
                            });
                          },
                          hint: 'Select Account Type',
                        ),
                        CustomButton(
                          text: 'Scan Card',
                          onClick: _submit,
                          disabled: !_validForm,
                        ),
                      ],
              ),
      ),
    );
  }
}
