import 'package:admin_jawara/controller/controller.dart';
import 'package:admin_jawara/models/items.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:admin_jawara/pages/homepage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';

final rupiah = new NumberFormat("#,##0.00", "id_ID");

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _database = FirebaseDatabase.instance.reference();
  final _controller = ScannerController();
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
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder(
                  stream: _database.child("items").onValue,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var totalAset = [];
                    num sum = 0;
                    if (snapshot.hasData) {
                      final _items =
                          Map.from((snapshot.data! as Event).snapshot.value);
                      _items.forEach((key, value) {
                        final _item = Item.fromRTDB(Map.from(value));
                        final asetItem = _item.harga * _item.stok;
                        totalAset.add(asetItem);
                      });
                      totalAset.forEach((element) {
                        sum = sum + element;
                      });
                    }

                    return Container(
                      child: Text(
                        "Total Aset: Rp ${rupiah.format(sum).toString()}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
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
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 40,
                                // color: Colors.blue,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "Cek Stok",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
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
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    scanBarcodeNormal();
                                  },
                                  child: Text(
                                    "Scan",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ]));
  }
}
