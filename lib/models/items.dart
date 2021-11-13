import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class Item {
  String item;
  int stok;
  int harga;
  // Timestamp updateAt;
  // String user;
  String kategori;

  Item(
      {required this.item,
      required this.stok,
      // required this.updateAt,
      required this.kategori,
      required this.harga
      // required this.user}
      });

  factory Item.fromRTDB(Map<String, dynamic> value) {
    return Item(
      item: value["item"] ?? "nama barang",

      //  value["stok"]!,
      kategori: value["kategori"] ?? "jdhgj",
      harga: value["harga"] ?? 0,
      stok: value["stok"] ?? 0,
      // updateAt: Timestamp.fromMicrosecondsSinceEpoch(value["updateAt"]),
      // user: value["pengguna"]!
    );
  }

  Map toJson() => {
        "item": item,
        "stok": stok,
        "updateAt": Timestamp.now(),
        "harga": harga,
        // "user": user,
        "category": kategori,
      };
}
