import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

// import 'package:crypto/crypto.dart';

import 'package:pointycastle/api.dart';

import 'constants.dart';

class EmvUtils {
  static const List emvTags = EMVTAGS;
  static const List currencies = CURRENCIES;
  static const List countryCodes = COUNTRY_CODES;

  // 70145a0840179541046963575f24032608319f4a0182
  static List decode(dynamic todecode) {
    Uint8List codeArr = Uint8List(0);
    if (todecode.runtimeType == String) {
      codeArr = hexToBytes(todecode);
    } else {
      codeArr =
          Uint8List.fromList((todecode as List).map((x) => x as int).toList());
    }
    // RegExp regex = RegExp(
    //     r'^(' +
    //         '${emvTags.where((e) => !e['tag'].contains('x')).map((e) => e['tag']).join('|')})',
    //     caseSensitive: false);
    List sval = codeArr;
    int frolen = 0;
    List decoded = [];

    getTag(arr) {
      try {
        var ioff = 0;
        var itag = arr[ioff++];
        var info = {'tagLength': 1};
        if ((itag & 0x1F) == 0x1F) {
          itag = (itag << 8) | arr[ioff++];
          info['tagLength'] = 2;
        }

        var ilen = arr[ioff++];
        info['lenCount'] = 1;
        if (ilen == 0x81) {
          ilen = arr[ioff++];
          info['lenCount'] = 2;
        }

        var ival = arr.sublist(ioff, ioff + ilen);
        return {...info, 'tag': itag, 'length': ilen, 'value': ival};
      } catch (e) {
        return {};
      }
    }

    while (sval.isNotEmpty) {
      var val = sval;
      while (getTag(val).isNotEmpty) {
        var tagInfo = getTag(val);
        var hexTag =
            tagInfo['tag'].toRadixString(16).toUpperCase().padLeft(2, '0');
        var lenhex =
            tagInfo['length'].toRadixString(16).toUpperCase().padLeft(2, '0');
        var newVal = tagInfo['value']
            .map((v) => v.toRadixString(16).padLeft(2, '0'))
            .join('');

        var tagobj =
            emvTags.firstWhere((e) => e['tag'] == hexTag, orElse: () => {});
        var desc = tagobj['name'];
        var deccopy = [...decoded];
        deccopy.sort(
            (a, b) => a['rawValue'].length.compareTo(b['rawValue'].length));
        decoded.add({
          'tag': hexTag,
          'lenHex': lenhex,
          'name': desc ?? 'Unknown Tag',
          'ownerTag': decoded.isEmpty
              ? ''
              : deccopy.firstWhere(
                  (d) => d['rawValue'].contains(
                      '$hexTag${tagInfo['lenCount'] == 2 ? '81' : ''}$lenhex$newVal'
                          .toLowerCase()),
                  orElse: () => {})['tag'],
          'rawValue': newVal,
          'decodedValue': RegExp(r'^an', caseSensitive: false)
                  .hasMatch(tagobj['type'].toString())
              ? String.fromCharCodes(hexToBytes(newVal))
              : desc.toString().contains(
                      RegExp(r'country|currency', caseSensitive: false))
                  ? desc.toString().toLowerCase().contains('currency')
                      ? () {
                          var match = currencies.firstWhere((c) =>
                              int.parse(c['number']) == int.parse(newVal));
                          return '${match['name']} (${match['code']})';
                        }()
                      : () {
                          return countryCodes.firstWhere((c) =>
                              int.parse(c['code']) ==
                              int.parse(newVal))['name'];
                        }()
                  : newVal,
        });
        val = tagInfo['value'];
        frolen += (tagInfo['tagLength'] + tagInfo['lenCount']) as int;
        var primitives = ['0', '4', '5', '8', '9', 'C', 'D'];
        var constructed = ['2', '3', '6', '7', 'A', 'B', 'E', 'F'];
        if (RegExp(r'' '^(${primitives.join('|')})', caseSensitive: false)
            .hasMatch(hexTag)) {
          break;
        }
      }
      sval = [];
      int decValLen = frolen + val.length;
      if (decValLen < codeArr.length) {
        sval = codeArr.sublist(decValLen);
        frolen = codeArr.length - sval.length;
      }
    }

    return decoded;
  }

  static String bytesToHex(bytes) {
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join('');
  }

  static Uint8List hexToBytes(String hex) {
    List<int> l = [];
    for (int i = 0; i < hex.length; i += 2) {
      l.add(int.parse('0x${hex[i]}${hex[i + 1]}'));
    }
    return Uint8List.fromList(l);
  }

  static Map genPDOLCommand(String pdolval, double amnt) {
    var retRes = '';
    int offset = 0;
    int tag;
    int length;
    var iccData = [];
    print(pdolval);
    List codeArr = hexToBytes(pdolval);
    print(codeArr);
    updateResp(ptag, len, comm) {
      retRes += comm;
      iccData.add({'tag': ptag, 'lenHex': len, 'rawValue': comm});
    }

    while (offset < codeArr.length) {
      tag = codeArr[offset++];
      if ((tag & 0x1F) == 0x1F) {
        tag = (tag << 8) | codeArr[offset++];
      }

      length = codeArr[offset++];
      if (length == 0x81) {
        length = codeArr[offset++];
      }

      // value = codeArr.sublist(offset, offset + length);
      // offset++;
      String hexTag = tag.toRadixString(16).toUpperCase().padLeft(2, '0');
      String lenhex = length.toRadixString(16).toUpperCase().padLeft(2, '0');
      if (hexTag == '9F66') {
        updateResp(hexTag, lenhex, getTTQ());
      } else if (hexTag == '9F02') {
        updateResp(
            hexTag,
            lenhex,
            (num.parse(amnt.toStringAsFixed(2)) * 100)
                .toString()
                .replaceAll(RegExp(r'\.\d+'), '')
                .padLeft(12, '0'));
      } else if (hexTag == '9F03') {
        updateResp(hexTag, lenhex, '000000000000');
      } else if (hexTag == '9F1A') {
        updateResp(
            hexTag,
            lenhex,
            countryCodes
                .firstWhere((c) => c['name'] == 'Nigeria')['code']
                .padLeft(4, '0'));
      } else if (hexTag == '95') {
        updateResp(hexTag, lenhex, '0000000000');
      } else if (hexTag == '5F2A') {
        updateResp(
            hexTag,
            lenhex,
            currencies
                .firstWhere((c) => c['code'] == 'NGN')['number']
                .padLeft(4, '0'));
      } else if (hexTag == '9A') {
        var now = DateTime.now();
        var comm =
            '${now.year.toString().substring(2)}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
        updateResp(hexTag, lenhex, comm);
      } else if (hexTag == '9F21') {
        var now = DateTime.now();
        var comm =
            '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
        updateResp(hexTag, lenhex, comm);
      } else if (hexTag == '9C') {
        updateResp(hexTag, lenhex, '00');
      } else if (hexTag == '9F35') {
        updateResp(hexTag, lenhex, '22');
      } else if (hexTag == '9F37') {
        updateResp(hexTag, lenhex, genRandHex(8));
      } else if (hexTag == '9F33') {
        updateResp(hexTag, lenhex, 'E0A000');
      } else if (hexTag == '9F40') {
        updateResp(hexTag, lenhex, '8e00b05005');
      } else if (hexTag == '9F5C') {
        updateResp(hexTag, lenhex, '7A45123EE59C7F40');
      } else if (hexTag == '9F58') {
        updateResp(hexTag, lenhex, '01');
      } else if (hexTag == '9F59') {
        updateResp(hexTag, lenhex, 'C08000');
      }
    }
    print(retRes.length);
    print(retRes);
    var finalHexCom =
        '83${(retRes.length / 2).toInt().toRadixString(16).padLeft(2, '0')}$retRes';
    return {
      'gpoCommand': finalHexCom,
      'gpoCommandList': hexToBytes(finalHexCom),
      'iccData': iccData
    };
  }

  static Map genCDOLCommand(String pdolval, double amnt) {
    var retRes = '';
    int offset = 0;
    int tag;
    int length;
    var iccData = [];
    List codeArr = hexToBytes(pdolval);
    updateResp(ptag, len, comm) {
      retRes += comm;
      iccData.add({'tag': ptag, 'lenHex': len, 'rawValue': comm});
    }

    while (offset < codeArr.length) {
      tag = codeArr[offset++];
      if ((tag & 0x1F) == 0x1F) {
        tag = (tag << 8) | codeArr[offset++];
      }

      length = codeArr[offset++];
      if (length == 0x81) {
        length = codeArr[offset++];
      }

      // value = codeArr.sublist(offset, offset + length);
      // offset++;
      String hexTag = tag.toRadixString(16).toUpperCase().padLeft(2, '0');
      String lenhex = length.toRadixString(16).toUpperCase().padLeft(2, '0');
      // print(hexTag);
      if (hexTag == '9F02') {
        updateResp(
            hexTag,
            lenhex,
            (num.parse(amnt.toStringAsFixed(2)) * 100)
                .toString()
                .replaceAll(RegExp(r'\.\d+'), '')
                .padLeft(12, '0'));
      } else if (hexTag == '9F03') {
        updateResp(hexTag, lenhex, '000000000000');
      } else if (hexTag == '9F1A') {
        updateResp(
            hexTag,
            lenhex,
            countryCodes
                .firstWhere((c) => c['name'] == 'Nigeria')['code']
                .padLeft(4, '0'));
      } else if (hexTag == '95') {
        updateResp(hexTag, lenhex, '0000000000');
      } else if (hexTag == '5F2A') {
        updateResp(
            hexTag,
            lenhex,
            currencies
                .firstWhere((c) => c['code'] == 'NGN')['number']
                .padLeft(4, '0'));
      } else if (hexTag == '9A') {
        var now = DateTime.now();
        var comm =
            '${now.year.toString().substring(2)}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
        updateResp(hexTag, lenhex, comm);
      } else if (hexTag == '9F21') {
        var now = DateTime.now();
        var comm =
            '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
        updateResp(hexTag, lenhex, comm);
      } else if (hexTag == '9C') {
        updateResp(hexTag, lenhex, '00');
      } else if (hexTag == '9F35') {
        updateResp(hexTag, lenhex, '22');
      } else if (hexTag == '9F37') {
        updateResp(hexTag, lenhex, genRandHex(8));
      } else if (hexTag == '9F33') {
        // updateResp(hexTag, lenhex, 'E0A000');
        updateResp(hexTag, lenhex, 'E0F8C8');
      } else if (hexTag == '9F40') {
        updateResp(hexTag, lenhex, '8e00b05005');
      } else if (hexTag == '9F5C') {
        updateResp(hexTag, lenhex, '7A45123EE59C7F40');
      } else if (hexTag == '9F58') {
        updateResp(hexTag, lenhex, '01');
      } else if (hexTag == '9F59') {
        updateResp(hexTag, lenhex, 'C08000');
      } else if (hexTag == '9F34') {
        updateResp(hexTag, lenhex, '1F0302');
      } else if (hexTag == '9F7C') {
        updateResp(hexTag, lenhex, '0'.padLeft(40, '0'));
      } else if (hexTag == '9F45') {
        updateResp(hexTag, lenhex, '0000');
      } else if (hexTag == '9F4C') {
        updateResp(hexTag, lenhex, '0'.padLeft(16, '0'));
      }
    }
    var finalHexCom = retRes;
    return {
      'command': finalHexCom,
      'commandList': hexToBytes(finalHexCom),
      'iccData': iccData
    };
  }

  // static Map genDDOLCommand(String pdolval, double amnt) {
  //   var retRes = '';
  //   int offset = 0;
  //   int tag;
  //   int length;
  //   var iccData = [];
  //   List codeArr = hexToBytes(pdolval);
  //   updateResp(ptag, len, comm, {static = false}) {
  //     if (!static) {
  //       retRes += comm;
  //     }
  //     iccData.add({'tag': ptag, 'lenHex': len, 'rawValue': comm});
  //   }

  //   while (offset < codeArr.length) {
  //     tag = codeArr[offset++];
  //     if ((tag & 0x1F) == 0x1F) {
  //       tag = (tag << 8) | codeArr[offset++];
  //     }

  //     length = codeArr[offset++];
  //     if (length == 0x81) {
  //       length = codeArr[offset++];
  //     }

  //     // value = codeArr.sublist(offset, offset + length);
  //     // offset++;
  //     String hexTag = tag.toRadixString(16).toUpperCase().padLeft(2, '0');
  //     String lenhex = length.toRadixString(16).toUpperCase().padLeft(2, '0');
  //     // print(hexTag);
  //     if (hexTag == '9F02') {
  //       updateResp(
  //           hexTag,
  //           lenhex,
  //           (num.parse(amnt.toStringAsFixed(2)) * 100)
  //               .toString()
  //               .replaceAll(RegExp(r'\.\d+'), '')
  //               .padLeft(12, '0'));
  //     } else if (hexTag == '9F03') {
  //       updateResp(hexTag, lenhex, '000000000000');
  //     } else if (hexTag == '9F1A') {
  //       updateResp(
  //           hexTag,
  //           lenhex,
  //           countryCodes
  //               .firstWhere((c) => c['name'] == 'Nigeria')['code']
  //               .padLeft(4, '0'));
  //     } else if (hexTag == '95') {
  //       updateResp(hexTag, lenhex, '0000000000');
  //     } else if (hexTag == '5F2A') {
  //       updateResp(
  //           hexTag,
  //           lenhex,
  //           currencies
  //               .firstWhere((c) => c['code'] == 'NGN')['number']
  //               .padLeft(4, '0'));
  //     } else if (hexTag == '9A') {
  //       var now = DateTime.now();
  //       var comm =
  //           '${now.year.toString().substring(2)}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
  //       updateResp(hexTag, lenhex, comm);
  //     } else if (hexTag == '9F21') {
  //       var now = DateTime.now();
  //       var comm =
  //           '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
  //       updateResp(hexTag, lenhex, comm);
  //     } else if (hexTag == '9C') {
  //       updateResp(hexTag, lenhex, '00');
  //     } else if (hexTag == '9F35') {
  //       updateResp(hexTag, lenhex, '22');
  //     } else if (hexTag == '9F37') {
  //       updateResp(hexTag, lenhex, genRandHex(8));
  //     } else if (hexTag == '9F33') {
  //       // updateResp(hexTag, lenhex, 'E0A000');
  //       updateResp(hexTag, lenhex, 'E0F8C8');
  //     } else if (hexTag == '9F40') {
  //       updateResp(hexTag, lenhex, '8e00b05005');
  //     } else if (hexTag == '9F5C') {
  //       updateResp(hexTag, lenhex, '7A45123EE59C7F40');
  //     } else if (hexTag == '9F58') {
  //       updateResp(hexTag, lenhex, '01');
  //     } else if (hexTag == '9F59') {
  //       updateResp(hexTag, lenhex, 'C08000');
  //     } else if (hexTag == '9F34') {
  //       updateResp(hexTag, lenhex, '1F0302');
  //     } else if (hexTag == '9F7C') {
  //       updateResp(hexTag, lenhex, '0'.padLeft(40, '0'));
  //     } else if (hexTag == '9F45') {
  //       updateResp(hexTag, lenhex, '0000');
  //     } else if (hexTag == '9F4C') {
  //       updateResp(hexTag, lenhex, '0'.padLeft(16, '0'));
  //     }
  //   }
  //   var exist = iccData.firstWhere((t) => t['tag'] == '9F02', orElse: () => {});
  //   if (exist.isEmpty) {
  //     for (var hexTag in [
  //       '9F02',
  //       '9F03',
  //       '9C',
  //       '9F35',
  //       '9A',
  //       '5F2A',
  //       '95',
  //       '9F1A'
  //     ]) {
  //       if (hexTag == '9F02') {
  //         updateResp(
  //           hexTag,
  //           '06',
  //           (num.parse(amnt.toStringAsFixed(2)) * 100)
  //               .toString()
  //               .replaceAll(RegExp(r'\.\d+'), '')
  //               .padLeft(12, '0'),
  //           static: true,
  //         );
  //       } else if (hexTag == '9F03') {
  //         updateResp(
  //           hexTag,
  //           '06',
  //           '000000000000',
  //           static: true,
  //         );
  //       } else if (hexTag == '9F1A') {
  //         updateResp(
  //           hexTag,
  //           '02',
  //           countryCodes
  //               .firstWhere((c) => c['name'] == 'Nigeria')['code']
  //               .padLeft(4, '0'),
  //           static: true,
  //         );
  //       } else if (hexTag == '95') {
  //         updateResp(
  //           hexTag,
  //           '05',
  //           '0000000000',
  //           static: true,
  //         );
  //       } else if (hexTag == '5F2A') {
  //         updateResp(
  //           hexTag,
  //           '02',
  //           currencies
  //               .firstWhere((c) => c['code'] == 'NGN')['number']
  //               .padLeft(4, '0'),
  //           static: true,
  //         );
  //       } else if (hexTag == '9A') {
  //         var now = DateTime.now();
  //         var comm =
  //             '${now.year.toString().substring(2)}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
  //         updateResp(
  //           hexTag,
  //           '03',
  //           comm,
  //           static: true,
  //         );
  //       } else if (hexTag == '9F21') {
  //         var now = DateTime.now();
  //         var comm =
  //             '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
  //         updateResp(
  //           hexTag,
  //           '03',
  //           comm,
  //           static: true,
  //         );
  //       } else if (hexTag == '9C') {
  //         updateResp(
  //           hexTag,
  //           '01',
  //           '00',
  //           static: true,
  //         );
  //       } else if (hexTag == '9F35') {
  //         updateResp(
  //           hexTag,
  //           '01',
  //           '22',
  //           static: true,
  //         );
  //       }
  //     }
  //   }
  //   var finalHexCom = retRes;
  //   return {
  //     'command': finalHexCom,
  //     'commandList': hexToBytes(finalHexCom),
  //     'iccData': iccData
  //   };
  // }

  static String genRandHex(n) {
    var hex = '1234567890ABCDEF';
    var ret = '';
    for (int i = 0; i < n; i++) {
      ret += hex[Random.secure().nextInt(16)];
    }
    return ret;
  }

  static String genICCData(List totalDecoded) {
    var iccData = '9F3303E0F8C8';
    var noRepeatTags = simplifyTotalDecoded(totalDecoded);
    for (var t in noRepeatTags) {
      var regex =
          RegExp(r'' '^(${ICC_DATA_TAGS.map((i) => i['tag']).join('|')})');
      if (regex.hasMatch(t['tag'])) {
        print(t['tag']);
        iccData += '${t['tag']}${t['lenHex']}${t['rawValue']}';
      }
    }
    return iccData.toUpperCase();
  }

  static String getTTQ() {
    var com1 = [
      {'option': 'Contactless MSD', 'value': 1},
      {'option': 'Contactless VSDC', 'value': 1},
      {'option': 'Contactless qVSDC', 'value': 1},
      {'option': 'EMV contact chip', 'value': 1},
      {'option': 'Offline-only reader', 'value': 0},
      {'option': 'Online PIN', 'value': 0},
      {'option': 'Signature', 'value': 0},
      {'option': 'Offline data auth (ODA)', 'value': 0},
    ];
    var com2 = [
      {'option': 'Require Online Crypt', 'value': 0},
      {'option': 'CVM required', 'value': 0},
      {'option': 'Offline PIN support', 'value': 1},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
    ];
    var com3 = [
      {'option': 'Issuer update process', 'value': 0},
      {'option': 'Mobile functionality', 'value': 1},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
    ];
    var com4 = [
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
      {'option': 'RFU(Reserved Future Use)', 'value': 0},
    ];
    return comToHex([com1, com2, com3, com4]);
  }

  static String comToHex(List comarr) {
    return comarr
        .map((c) => int.parse(c.map((o) => o['value']).join(''), radix: 2)
            .toRadixString(16)
            .padLeft(2, '0'))
        .join('');
  }

  static String genPinBlock(String pin, String pan) {
    var bl1 = '0${pin.length}$pin'.padRight(16, 'f');
    var bl2 = '0000${pan.substring(pan.length - 13, pan.length - 1)}';
    var pinBlock = '';
    for (int i = 0; i < 16; i++) {
      pinBlock += (int.parse(bl1[i], radix: 16) ^ int.parse(bl2[i], radix: 16))
          .toRadixString(16);
    }
    return pinBlock.toUpperCase();
  }

  static String genTripleDESEncPinBlock(String pinblock, String key) {
    final keyBytes = utf8.encode(key);
    final inputBytes = utf8.encode(pinblock);

    final cipher = PaddedBlockCipher('AES/ECB/PKCS7')
      ..init(
        true,
        PaddedBlockCipherParameters(
          KeyParameter(Uint8List.fromList(keyBytes)),
          PaddedBlockCipherParameters(null, null),
        ),
      );

    return base64.encode(cipher.process(Uint8List.fromList(inputBytes)));
  }

  static List simplifyTotalDecoded(List totalDecoded) {
    var noRepeatTags = [];
    for (var t in totalDecoded) {
      var exist = noRepeatTags.firstWhere((n) => n['tag'] == t['tag'],
          orElse: () => {});
      if (exist.isEmpty) {
        noRepeatTags.add(t);
      }
    }
    return noRepeatTags;
  }
}
