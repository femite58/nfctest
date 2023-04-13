import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';

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
        0x7A,
        0x00,
        0x00,
        0x00,
        0x00,
        0x41,
        0x01,
        0x00,
        0x0
      ]);
      Uint8List? res = await IsoDep.from(tag)?.transceive(data: com);
      print(res);
      if (res != null) {
        var toPass = [...res].sublist(0, res.length - 2);
        utf8.decode(toPass);
      }
      // showDialog(
      //   context: context,
      //   builder: (ctx) => AlertDialog(
      //     title: const Text('Card'),
      //     content: Text('Card data is ${json.encode(tag.data)}'),
      //   ),
      // );
      // MifareClassic.from(tag)
      NfcManager.instance.stopSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: !_nfcsupp
            ? const Text(
                'Your device do not support nfc or nfc is switched off on this device')
            : TextButton(
                onPressed: _tagRead,
                child: const Text('Scan Card'),
              ),
      ),
    );
  }
}
