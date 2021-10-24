import 'package:flutter/material.dart';

class StokKeluar extends StatefulWidget {
  const StokKeluar({Key? key}) : super(key: key);

  @override
  _StokKeluarState createState() => _StokKeluarState();
}

class _StokKeluarState extends State<StokKeluar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "Scan",
              style: TextStyle(color: Colors.white),
            ))
      ],
    ));
  }
}
