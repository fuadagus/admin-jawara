import 'package:admin_jawara/component/header.dart';
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
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: GradientAppBar(widget.category == "Alat Silat dan Beladiri"
            ? "Alat Silat dan Beladiri"
            : widget.category == "Alat Fitnes"
                ? "Alat Fitnes"
                : "Dekorasi Rumah"),
        preferredSize: const Size.fromHeight(50),
      ),
      body: StreamBuilder<Object>(
          stream: _database.child("items").onValue,
          builder: (context, snapshot) {
            final tileList = <Widget>[];

            if (snapshot.hasData) {
              final _items = Map.from((snapshot.data! as Event).snapshot.value);
              print(_items);
              print(_items["1000"]);
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
                          subtitle: Text(_item.stok.toString()),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert_rounded)),
                        ),
                      ),
                    ));

                tileList.add(itemList);

                print(tileList.contains("1000"));
              });
            }
            return ListView(
              children: tileList,
            );
          }),
    );
  }
}
