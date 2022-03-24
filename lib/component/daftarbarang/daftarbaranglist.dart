import 'package:admin_jawara/component/daftarbarang/additem.dart';
import 'package:admin_jawara/component/daftarbarang/edititem.dart';
import 'package:admin_jawara/component/header.dart';
import 'package:admin_jawara/models/items.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:admin_jawara/pages/dashboard.dart';

class DaftarBarangItem extends StatefulWidget {
  const DaftarBarangItem({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  _DaftarBarangItemState createState() => _DaftarBarangItemState();
}

class _DaftarBarangItemState extends State<DaftarBarangItem> {
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TambahBarang(kategori: widget.category));
        },
      ),
      appBar: PreferredSize(
        child: GradientAppBar(widget.category == "Alat Silat dan Beladiri"
            ? "Alat Silat dan Beladiri"
            : widget.category == "Alat Fitnes"
                ? "Alat Fitnes & Olahraga"
                : widget.category == "Hobi"
                    ? "Hobi"
                    : widget.category == "Dekorasi Rumah"
                        ? "Dekorasi Rumah & Perabot"
                        : widget.category == "Atribut Pencak Silat"
                            ? "Atribut Pencak Silat"
                            : widget.category == "Senjata Beladiri"
                                ? "Senjata Beladiri"
                                : "Alat Latihan Target Sasaran"),
        preferredSize: const Size.fromHeight(50),
      ),
      body: StreamBuilder<Object>(
          stream: _database.child("items").onValue,
          builder: (context, snapshot) {
            final tileList = <Widget>[];

            if (snapshot.hasData) {
              final _items = Map.from((snapshot.data! as Event).snapshot.value);

              _items.forEach((key, value) {
                final _item = Item.fromRTDB(Map.from(value));
                final itemList = Visibility(
                    visible: _item.kategori != widget.category ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Text(key),
                          title: Text(_item.item),
                          subtitle: Text(
                              "Sisa stok: ${_item.stok.toString()}  Harga: ${_item.harga} \nTotal Aset: Rp ${rupiah.format(_item.stok * _item.harga)}"),
                          trailing: IconButton(
                              onPressed: () {
                                Get.to(EditBarang(
                                    kategori: _item.kategori,
                                    nama: _item.item,
                                    harga: _item.harga,
                                    id: key,
                                    stok: _item.stok));
                              },
                              icon: Icon(Icons.more_vert_rounded)),
                        ),
                      ),
                    ));

                tileList.add(itemList);
              });
            }
            return ListView(
              children: tileList,
            );
          }),
    );
  }
}
