import 'package:admin_jawara/model/model.dart';
import 'package:flutter/material.dart';

class DaftarBarangItem extends StatefulWidget {
  const DaftarBarangItem({Key? key}) : super(key: key);

  @override
  _DaftarBarangItemState createState() => _DaftarBarangItemState();
}

class _DaftarBarangItemState extends State<DaftarBarangItem> {
  final _items = items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: MediaQuery.of(context).size.width < 420 ? 200 : 150,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                height: MediaQuery.of(context).size.width < 420 ? 180 : 130,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 20,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 4),
                                  child: Center(
                                    child: Text(
                                      _items[index]['nama barang'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (MediaQuery.of(context).size.width < 420)
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  _items[index]['sisa stok'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (MediaQuery.of(context).size.width > 1041)
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    items[index]['sisa stok'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            if (MediaQuery.of(context).size.width < 420)
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "EDIT",
                                    style: TextStyle(color: Colors.white),
                                  )),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                    'ID: ' + _items[index]['kode'].toString()),
                              ),
                              Expanded(
                                  flex: 1, child: Text("diupdate oleh:...")),
                              if (MediaQuery.of(context).size.width > 420)
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "EDIT",
                                      style: TextStyle(color: Colors.white),
                                    )),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
