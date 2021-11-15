import 'package:admin_jawara/controller/controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:admin_jawara/pages/homepage.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _database = FirebaseDatabase.instance.reference();
  final _controller = ScannerController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                                  onPressed: () {},
                                  child: Text(
                                    "Scan",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))
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
