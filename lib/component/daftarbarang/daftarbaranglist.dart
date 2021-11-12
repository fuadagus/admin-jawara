import 'package:admin_jawara/component/header.dart';
import 'package:admin_jawara/model/model.dart';
import 'package:admin_jawara/models/items.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DaftarBarangItem extends StatefulWidget {
  const DaftarBarangItem({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  _DaftarBarangItemState createState() => _DaftarBarangItemState();
}

class _DaftarBarangItemState extends State<DaftarBarangItem> {
  final _items = items;
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: GradientAppBar(widget.category == "silat"
            ? "Alat Silat dan Beladiri"
            : "Alat Beladiri"),
        preferredSize: Size.fromHeight(50),
      ),
      body: Container(
          child: StreamBuilder<Object>(
              stream: _database.child(widget.category).onValue,
              builder: (context, snapshot) {
                final tileList = <Widget>[];

                if (snapshot.hasData) {
                  final _items =
                      Map.from((snapshot.data! as Event).snapshot.value);
                  print(_items);
                  _items.forEach((key, value) {
                    final _item = Item.fromRTDB(Map.from(value));
                    final itemList = ListTile(
                      title: Text(_item.item),
                      subtitle: Text(_item.stok.toString()),
                    );

                    tileList.add(itemList);

                    print(tileList.contains("1000"));
                  });
                }
                return ListView(
                  children: tileList,
                );
              })),
    );
  }
}
