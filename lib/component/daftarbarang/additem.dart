import 'package:admin_jawara/component/daftarbarang/daftarbaranglist.dart';
import 'package:admin_jawara/component/daftarbarang/formeditlist.dart';
import 'package:admin_jawara/controller/controller.dart';
import 'package:admin_jawara/pages/daftarbarang.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahBarang extends StatefulWidget {
  final String kategori;
  TambahBarang({Key? key, required this.kategori}) : super(key: key);

  @override
  _TambahBarangState createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final _database = FirebaseDatabase.instance.reference();

  EditBarangController _tambahBarangController = EditBarangController();
  Key _key = GlobalKey<FormState>();
  Key _key2 = GlobalKey<FormState>();
  Key _key3 = GlobalKey<FormState>();
  Key _key4 = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();

  TextEditingController _stokController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "TAMBAH LIST",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(width: 45, child: Text("Nama")),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    controller: _namaController,
                                    key: _key,
                                  )),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(width: 45, child: Text("ID")),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    controller: _idController,
                                    key: _key2,
                                  )),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(width: 45, child: Text("Harga")),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    controller: _hargaController,
                                    keyboardType: TextInputType.number,
                                    key: _key3,
                                  )),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(width: 45, child: Text("Stok")),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    controller: _stokController,
                                    keyboardType: TextInputType.number,
                                    key: _key4,
                                  )),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _database.child("items").update({
                      "${_idController.text}": {
                        "item": _namaController.text,
                        "stok": int.parse(_stokController.text),
                        "kategori": widget.kategori,
                        "harga": int.parse(_hargaController.text)
                      }
                    });
                    Get.back();
                  },
                  child: Text(
                    "Okee",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
