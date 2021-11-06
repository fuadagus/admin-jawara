// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


//  class ScannerStreamWidget extends StatefulWidget {
//    const ScannerStreamWidget({ Key? key }) : super(key: key);
 
//    @override
//    _ScannerStreamWidgetState createState() => _ScannerStreamWidgetState();
//  }
 
//  class _ScannerStreamWidgetState extends State<ScannerStreamWidget> {
//    @override
//    Widget build(BuildContext context) {
//      return Obx(() => 
//      Scaffold(
//        body: Column(
//          children: [
//            StreamBuilder(builder: 
//            )
//          ],
//        ),
//      )
//      );
//    }
//  }
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//             '#ff6666', 'Gak Sido', true, ScanMode.BARCODE)!
//         .listen((barcode) {
//       //   setState(() {
//       //     _scanBarcode = barcode;
//       //     Get.snackbar("Hasil", _scanBarcode);
//       //   });
//       //   print(barcode);
//       // }
//     });
  // }