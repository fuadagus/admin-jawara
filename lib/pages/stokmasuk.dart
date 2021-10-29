import 'package:admin_jawara/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class StokMasuk extends StatefulWidget {
  const StokMasuk({Key? key}) : super(key: key);

  @override
  _StokMasukState createState() => _StokMasukState();
}

class _StokMasukState extends State<StokMasuk> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Scanner());
  }
}

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String _scanBarcode = 'Scan Sek To';
  final _controller = ScannerController();
  // final _hasil = Get.put(Controller().hasil.value);

  @override
  void initState() {
    super.initState();
  }

  // Future<void> scanQR() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Gak Sido', true, ScanMode.QR);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }

  // Future<void> startBarcodeScanStream() async {
  //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
  //           '#ff6666', 'Gak Sido', true, ScanMode.BARCODE)!
  //       .listen((barcode) {
  //     Get.snackbar("hasil", barcode);
  //     Get.defaultDialog();
  //     //   setState(() {
  //     //     _scanBarcode = barcode;
  //     //     Get.snackbar("Hasil", _scanBarcode);
  //     //   });
  //     //   print(barcode);
  //     // }
  //   });
  // }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Gak Sido', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _controller.updateHasil(_controller.scanRes(barcodeScanRes));
    Get.snackbar("Hasil", '${_controller.hasil.value}');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Stok Masuk",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    scanBarcodeNormal();
                  },
                  child: const Text(
                    'Scan Kene Bro',
                    style: TextStyle(color: Colors.white),
                  )),
              Text('Hasile : ${_controller.hasil.value}\n',
                  style: const TextStyle(fontSize: 20)),
            ]));
  }
}
