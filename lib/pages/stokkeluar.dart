import 'package:admin_jawara/controller/controller.dart';
import 'package:admin_jawara/models/items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

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
    return const Scaffold(body: Scanner());
  }
}

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final _database = FirebaseDatabase.instance.reference();
  final _inputcontroller = InputController();
  String _scanBarcode = 'Scan Sek To';
  final _controller = ScannerController();
  final _dialogController = TextEditingController();

  // final _hasil = Get.put(Controller().hasil.value);

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Gak Sido', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    _controller.updateHasil(_controller.scanRes(barcodeScanRes));

    _database
        .child("items")
        .child("${_controller.hasil.value}")
        // .child("item")
        .once()
        .then((DataSnapshot snapshot) {
      if (snapshot.exists)
        _database.child("items").child("${_controller.hasil.value}").update(
            {"stok": ServerValue.increment(-(_controller.kelipatan.value))});
      print("${snapshot.value}");
      Get.snackbar("Stok Keluar", "${snapshot.value}");
    });
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
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Stok Keluar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            _controller.kurangiKelipatan();
                          },
                          icon: Icon(Icons.remove_circle_outline_rounded)),
                      Center(
                        child: InkWell(
                          onLongPress: () {
                            Get.defaultDialog(
                                barrierDismissible: true,
                                title: "Kelipatan",
                                content: TextField(
                                  controller: _dialogController,
                                  keyboardType: TextInputType.number,
                                ),
                                textConfirm: "Uklik",
                                confirmTextColor: Colors.white,
                                onConfirm: () {
                                  Get.back();
                                  _controller.updateKelipatan(
                                      int.parse(_dialogController.text));
                                  _dialogController.clear();
                                },
                                middleText: "");
                          },
                          child: Text(
                            "${_controller.kelipatan.value.toString()} X",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _controller.tambahKelipatan();
                          },
                          icon: Icon(Icons.add_circle_outline_rounded)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                          key: _inputcontroller.InputFormKey,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _inputcontroller.kodeController,
                                  decoration: InputDecoration(
                                      labelText: "Tulis manual"),
                                  onEditingComplete: () {
                                    _controller.updateHasil(_controller.scanRes(
                                        _inputcontroller.kodeController.text
                                            .toUpperCase()));
                                    _inputcontroller.kodeController.clear();

                                    _database
                                        .child("items")
                                        .child("${_controller.hasil.value}")
                                        // .child("item")
                                        .once()
                                        .then((DataSnapshot snapshot) {
                                      if (snapshot.exists)
                                        _database
                                            .child("items")
                                            .child("${_controller.hasil.value}")
                                            .update({
                                          "stok": ServerValue.increment(
                                              -(_controller.kelipatan.value)),
                                          // "updateAt": DateTime.now()
                                        });
                                      print("${snapshot.value}");
                                      Get.snackbar(
                                          "Stok Keluar", "${snapshot.value}");
                                    });
                                  },
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                  onPressed: () {
                                    _controller.updateHasil(_inputcontroller
                                        .kodeController.text
                                        .toUpperCase());
                                    _inputcontroller.kodeController.clear();

                                    _database
                                        .child("items")
                                        .child("${_controller.hasil.value}")
                                        .once()
                                        .then((DataSnapshot snapshot) {
                                      if (snapshot.exists)
                                        _database
                                            .child("items")
                                            .child("${_controller.hasil.value}")
                                            .update({
                                          "stok": ServerValue.increment(
                                              -(_controller.kelipatan.value))
                                        });
                                      print("${snapshot.value}");
                                      Get.snackbar(
                                          "Stok Keluar", "${snapshot.value}");
                                    });
                                  },
                                  child: Text(
                                    "Uklik",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )),
                    ),
                    Container(
                      width: 4,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          scanBarcodeNormal();
                        },
                        child: const Text(
                          'Scan',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
              Text('${_controller.hasil.value}\n ',
                  style: const TextStyle(fontSize: 20)),
              StreamBuilder(
                stream: _database
                    .child("items")
                    .child(_controller.hasil.value)
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var itemName = "Gong Kelist";
                  var stok = 0;

                  if (snapshot.hasData &&
                      (snapshot.data as Event).snapshot.exists) {
                    final item = (snapshot.data as Event).snapshot.value;
                    itemName = item["item"]!;
                    stok = item["stok"]!;
                    print(itemName);
                  }
                  return Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              SizedBox(height: 20),
                              Text(stok.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                  ))
                            ],
                          ),
                        )),
                      ),
                    ),
                  );
                },
              )
            ]));
  }
}
