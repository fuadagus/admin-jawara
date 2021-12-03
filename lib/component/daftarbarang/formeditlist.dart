import 'package:admin_jawara/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditNamaBarang extends StatefulWidget {
  final String nilaiAwal;
  EditNamaBarang({Key? key, required this.nilaiAwal}) : super(key: key);

  @override
  _EditNamaBarangState createState() => _EditNamaBarangState();
}

class _EditNamaBarangState extends State<EditNamaBarang> {
  TextEditingController _namaItemController = TextEditingController();
  Key _key = GlobalKey<FormState>();
  EditBarangController _editController = EditBarangController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            key: _key,
            initialValue: widget.nilaiAwal,
            // onEditingComplete: () {
            // _editController.nama = _namaItemController.text;
            // },
          )),
    );
  }
}

class EditJumlahBarang extends StatefulWidget {
  final String nilaiAwal;
  EditJumlahBarang({Key? key, required this.nilaiAwal}) : super(key: key);

  @override
  _EditJumlahBarangState createState() => _EditJumlahBarangState();
}

class _EditJumlahBarangState extends State<EditJumlahBarang> {
  TextEditingController _jumlahItemController = TextEditingController();
  Key _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: TextInputType.number,
            key: _key,
            initialValue: widget.nilaiAwal,
          )),
    );
  }
}

class EditIDBarang extends StatefulWidget {
  final String nilaiAwal;
  EditIDBarang({Key? key, required this.nilaiAwal}) : super(key: key);

  @override
  _EditIDBarangState createState() => _EditIDBarangState();
}

class _EditIDBarangState extends State<EditIDBarang> {
  TextEditingController _namaItemController = TextEditingController();
  Key _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            key: _key,
            initialValue: widget.nilaiAwal,
          )),
    );
  }
}

class EditHargaBarang extends StatefulWidget {
  final String nilaiAwal;
  EditHargaBarang({Key? key, required this.nilaiAwal}) : super(key: key);

  @override
  _EditHargaBarangState createState() => _EditHargaBarangState();
}

class _EditHargaBarangState extends State<EditHargaBarang> {
  TextEditingController _namaItemController = TextEditingController();
  Key _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: TextInputType.number,
            key: _key,
            initialValue: widget.nilaiAwal,
          )),
    );
  }
}
