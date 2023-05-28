import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';

import 'utils.dart';

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
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String _data = '';
  bool _nfcsupp = false;

  @override
  void initState() {
    NfcManager.instance.isAvailable().then((av) {
      setState(() {
        _nfcsupp = av;
      });
    });
    super.initState();
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      Uint8List com = Uint8List.fromList([
        0x00,
        0xA4,
        0x04,
        0x00,
        utf8.encode('2PAY.SYS.DDF01').length,
        ...utf8.encode('2PAY.SYS.DDF01'),
        0x00,
      ]);

      IsoDep? isodep = IsoDep.from(tag);
      // NdefMessage? ndef = await Ndef.from(tag)?.read();
      // ndef?.records.first.identifier;
      Uint8List? res = await isodep?.transceive(data: com);
      print(res);
      if (res != null) {
        var dres = EmvUtils.decode([...res].sublist(0, res.length - 2));
        records.add(TextFormField(
            initialValue: json.encode(EmvUtils.bytesToHex(
          [...res].sublist(0, res.length - 2),
        ))));
        records.add(TextFormField(
          initialValue: json.encode(dres),
        ));
        for (var e in dres) {
          print(e);
          print('label: ${e['name']}');
          print('value: ${e['rawValue']}');
          print('decoded: ${e['decodedValue']}');
        }
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
        if (aidres != null) {
          print(aidres);
          var daidres =
              EmvUtils.decode([...aidres].sublist(0, aidres.length - 2));
          records.add(TextFormField(
              initialValue: json.encode(EmvUtils.bytesToHex(
            [...aidres].sublist(0, aidres.length - 2),
          ))));
          records.add(TextFormField(
            initialValue: json.encode(daidres),
          ));
          for (var e in daidres) {
            print(e);
            print('label: ${e['name']}');
            print('value: ${e['rawValue']}');
            print('decoded: ${e['decodedValue']}');
          }
          Map pdol =
              daidres.firstWhere((p) => p['tag'] == '9F38', orElse: () => {});
          var pdolres;
          if (pdol.isEmpty) {
            pdolres = await isodep?.transceive(
                data: Uint8List.fromList(
                    [0x80, 0xa8, 0x00, 0x00, 0x02, 0x83, 0x00, 0x00]));
          } else {
            var com = EmvUtils.genPDOLCommand(
                pdol['rawValue'], 1.0)['gpoCommandList'];
            pdolres = await isodep?.transceive(
                data: Uint8List.fromList(
                    [0x80, 0xa8, 0x00, 0x00, com.length, ...com, 0x00]));
          }
          if (pdolres != null) {
            print(pdolres);
            var dpdolres =
                EmvUtils.decode([...pdolres].sublist(0, pdolres.length - 2));
            records.add(TextFormField(
                initialValue: json.encode(EmvUtils.bytesToHex(
              [...pdolres].sublist(0, pdolres.length - 2),
            ))));
            records.add(TextFormField(
              initialValue: json.encode(dpdolres),
            ));
            for (var e in dpdolres) {
              print(e);
              print('label: ${e['name']}');
              print('value: ${e['rawValue']}');
              print('decoded: ${e['decodedValue']}');
            }
            String afl =
                dpdolres.firstWhere((d) => d['tag'] == '94')['rawValue'];
            for (int i = 0; i < afl.length; i += 8) {
              var sfi = (int.parse('0x${afl.substring(0, 2)}') >> 3) << 3 | 4;
              var rec1 = int.parse('0x${afl.substring(2, 4)}');
              var recl = int.parse('0x${afl.substring(4, 6)}');
              for (int j = rec1; j <= recl; j++) {
                Uint8List? recRes = await isodep?.transceive(
                    data: Uint8List.fromList([
                  0x00,
                  0xB2,
                  j,
                  sfi,
                  0,
                ]));
                if (recRes != null) {
                  var dtoParse = EmvUtils.decode(
                      [...recRes].sublist(0, recRes.length - 2));
                  setState(() {
                    records.add(TextFormField(
                        initialValue: json.encode(EmvUtils.bytesToHex(
                      [...recRes].sublist(0, recRes.length - 2),
                    ))));
                    records.add(TextFormField(
                      initialValue: json.encode(dtoParse),
                    ));
                  });
                }
              }
            }
          }
        }
        // for (int sfi = 0; sfi < 31; sfi++) {
        //   for (int record = 0; record < 16; record++) {
        //     Uint8List cmd =
        //         Uint8List.fromList([0x00, 0xB2, record, (sfi << 3) | 4, 0x00]);
        //     Uint8List? tlv = await isodep?.transceive(data: cmd);
        //     print(tlv);
        //     if ((tlv != null) && (tlv.length >= 2)) {
        //       if (tlv[tlv.length - 2] == 0x90.toUnsigned(8) &&
        //           tlv.last == 0x00.toUnsigned(8)) {
        //         // file exists and contains data
        //         // byte[] data = Arrays.CopyOf(result, result.Length - 2);
        //         Uint8List toParse =
        //             Uint8List.fromList([...tlv].sublist(0, tlv.length - 2));
        //         var dtoParse = EmvUtils.decode(toParse);
        //         setState(() {
        //           records.add(TextFormField(
        //               initialValue: json.encode(EmvUtils.bytesToHex(
        //             toParse,
        //           ))));
        //           records.add(TextFormField(
        //             initialValue: json.encode(dtoParse),
        //           ));
        //         });
        //         for (var t in dtoParse) {
        //           print(t);
        //           print('label: ${t['name']}');
        //           print('value: ${t['rawValue']}');
        //           print('decoded: ${t['decodedValue']}');
        //         }
        //         break;
        //       }
        //     }
        //   }
        // }
      }
      print('done');
      await NfcManager.instance.stopSession();
    });
  }

  List<Widget> records = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !_nfcsupp
                ? const Text(
                    'Your device do not support nfc or nfc is switched off on this device')
                : TextButton(
                    onPressed: _tagRead,
                    child: const Text('Scan Card'),
                  ),
            ...records,
          ],
        ),
      ),
    );
  }
}
