import 'dart:math';
import 'dart:typed_data';

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
        if ((itag & 0x1F) == 0x1F) {
          itag = (itag << 8) | arr[ioff++];
        }

        var ilen = arr[ioff++];
        if (ilen == 0x81) {
          ilen = arr[ioff++];
        }

        var ival = arr.sublist(ioff, ioff + ilen);
        return {'tag': itag, 'length': ilen, 'value': ival};
      } catch (e) {
        return {};
      }
    }

    while (sval.isNotEmpty) {
      var val = sval;
      while (getTag(val).isNotEmpty) {
        var tagInfo = getTag(val);
        var hexTag = tagInfo['tag'].toRadixString(16).toUpperCase().padLeft(2, '0');
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
                  (d) => d['rawValue']
                      .contains('$hexTag$lenhex$newVal'.toLowerCase()),
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
        frolen += (hexTag.length > 2 ? 2 : 1) + 1;
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
    List codeArr = hexToBytes(pdolval);
    updateResp(ptag, len, comm) {
      retRes += comm;
      iccData.add({'tag': ptag, 'lenHex': len, 'value': comm});
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
      offset++;
      String hexTag = tag.toRadixString(16).toUpperCase().padLeft(2, '0');
      String lenhex = length.toRadixString(16).toUpperCase().padLeft(2, '0');
      if (hexTag == '9F66') {
        updateResp(hexTag, lenhex, getTTQ());
      }
      if (hexTag == '9F02') {
        updateResp(
            hexTag,
            lenhex,
            (num.parse(amnt.toStringAsFixed(2)) * 10)
                .toString()
                .padLeft(12, '0'));
      }
      if (hexTag == '9F03') {
        updateResp(hexTag, lenhex, '000000000000');
      }
      if (hexTag == '9F1A') {
        updateResp(
            hexTag,
            lenhex,
            countryCodes
                .firstWhere((c) => c['name'] == 'Nigeria')['code']
                .padLeft(4, '0'));
      }
      if (hexTag == '95') {
        updateResp(hexTag, lenhex, '0000000000');
      }
      if (hexTag == '5F2A') {
        updateResp(
            hexTag,
            lenhex,
            currencies
                .firstWhere((c) => c['code'] == 'NGN')['number']
                .padLeft(4, '0'));
      }
      if (hexTag == '9A') {
        var now = DateTime.now();
        var comm =
            '${now.year.toString().substring(2)}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
        updateResp(hexTag, lenhex, comm);
      }
      if (hexTag == '9C') {
        updateResp(hexTag, lenhex, '00');
      }
      if (hexTag == '9F37') {
        updateResp(hexTag, lenhex, genRandHex(8));
      }
    }
    var finalHexCom =
        '83${((retRes.length / 2) as int).toRadixString(16)}$retRes';
    return {
      'gpoCommand': finalHexCom,
      'gpoCommandList': hexToBytes(finalHexCom),
      'iccData': iccData
    };
  }

  static String genRandHex(n) {
    var hex = '1234567890ABCDEF';
    var ret = '';
    for (int i = 0; i < n; i++) {
      ret += hex[Random().nextInt(16)];
    }
    return ret;
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
            .toRadixString(16))
        .join('');
  }
}
