import 'package:admin_jawara/component/daftarbarang/daftarbarangkategori.dart';
import 'package:admin_jawara/component/daftarbarang/daftarbaranglist.dart';
import 'package:admin_jawara/responsive/responsive.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DaftarBarang extends StatefulWidget {
  const DaftarBarang({Key? key}) : super(key: key);

  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang> {
  // final _items = items;
  final jumlahStok = List.generate(1000, (index) => "$index");
  final _database = FirebaseDatabase.instance.reference();
  // final _listAddController = TextEditingController();
  TextEditingController _kodeController = TextEditingController();
  TextEditingController _itemController = TextEditingController();
  TextEditingController _stokController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(MediaQuery.of(context).size);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "KATEGORI",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: const Kategori(),
            ),
          ),
        ],
      ),
    );
  }
}
