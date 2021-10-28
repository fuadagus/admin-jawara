import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class StokKeluar extends StatefulWidget {
  const StokKeluar({Key? key}) : super(key: key);

  @override
  _StokKeluarState createState() => _StokKeluarState();
}

class _StokKeluarState extends State<StokKeluar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Scanner());
  }
}

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String _scanBarcode = 'Scan Sek To';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Gak Sido', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Gak Sido', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Gak Sido', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    if (barcodeScanRes.contains("~*~")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("~*~") + 3);
      });
    }
    if (barcodeScanRes.contains("`*`")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("`*`") + 3);
      });
    }
    if (barcodeScanRes.contains("`*~")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("`*~") + 3);
      });
    }
    if (barcodeScanRes.contains("~8`")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("~8`") + 3);
      });
    }

    if (barcodeScanRes.contains("`8`")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("`8`") + 3);
      });
    }
    if (barcodeScanRes.contains("`8~")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("`8~") + 3);
      });
    }
    if (barcodeScanRes.contains("~*`")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("~*`") + 3);
      });
    }
    if (barcodeScanRes.contains("~*~")) {
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("~*~") + 3);
      });
    } else
      setState(() {
        _scanBarcode =
            barcodeScanRes.substring(barcodeScanRes.indexOf("~*~") + 3);
      });

// else
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text(
              'Stok Keluar',
              style: TextStyle(color: Colors.white),
            )),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          scanBarcodeNormal();
                        },
                        child: Text(
                          'Scan Kene Bro',
                          style: TextStyle(color: Colors.white),
                        )),
                    // ElevatedButton(
                    //     onPressed: () => scanQR(), child: Text('Lak QR Kene')),
                    // // ElevatedButton(
                    // //     onPressed: () {
                    // //       startBarcodeScanStream();
                    // //     },
                    // //     child: Text('scan Teros')),
                    Text('Hasile : $_scanBarcode\n',
                        style: TextStyle(fontSize: 20)),
                  ]));
        }));
  }
}
