import 'dart:html';

import 'package:admin_jawara/responsive/responsive.dart';
import 'package:flutter/material.dart';

class DaftarBarang extends StatefulWidget {
  const DaftarBarang({Key? key}) : super(key: key);

  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang> {
  final items = List.generate(100, (index) => "item $index");
  final jumlahStok = List.generate(100, (index) => "$index");
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [Center(child: Text("Tambah")), Icon(Icons.add)],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        color: Colors.white,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Text(
                                  items[index],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Text(
                                  "Stok: " + jumlahStok[index],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            if (MediaQuery.of(context).size.width > 1041)
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    child: Text(
                                      "Masuk: " + jumlahStok[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            if (MediaQuery.of(context).size.width > 1041)
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    child: Text(
                                      "Keluar: " + jumlahStok[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
