import 'package:admin_jawara/component/daftarbarang/daftarbarangitem.dart';
import 'package:admin_jawara/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:admin_jawara/model/model.dart';

class DaftarBarang extends StatefulWidget {
  const DaftarBarang({Key? key}) : super(key: key);

  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang> {
  final _items = items;
  final jumlahStok = List.generate(1000, (index) => "$index");
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(MediaQuery.of(context).size);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 200,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Kode/Nama Barang",
                    ),
                    // onSaved: () {},
                  ),
                ),
                if (MediaQuery.of(context).size.width > 1041)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Center(child: Text("Tambah")),
                        const Icon(Icons.add)
                      ],
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: const DaftarBarangItem(),
            ),
          ),
          // Expanded(
          //   child: Footer(),
          // )
        ],
      ),
    );
  }
}
