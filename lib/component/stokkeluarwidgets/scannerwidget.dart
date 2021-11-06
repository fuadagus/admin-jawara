import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({Key? key}) : super(key: key);

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Column(
            children: const [],
          ),
        ));
  }
}
