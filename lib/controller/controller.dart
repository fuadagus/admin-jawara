import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScannerController extends GetxController {
  RxString hasil = "Scan sek lor".obs;
  RxInt kelipatan = 1.obs;
  void updateKelipatan(value) => kelipatan.value = value;
  void kurangiKelipatan() {
    if (kelipatan > 1) {
      kelipatan--;
    }
  }

  tambahKelipatan() {
    return kelipatan.value++;
  }

  void updateHasil(_value) => hasil.value = _value;

  String scanRes(results) {
    if (results.contains("~*~")) {
      return results.substring(results.indexOf("~*~") + 3);
    }
    if (results.contains("`*`")) {
      return results.substring(results.indexOf("`*`") + 3);
    }
    if (results.contains("`*~")) {
      return results.substring(results.indexOf("`*~") + 3);
    }
    if (results.contains("~8`")) {
      return results.substring(results.indexOf("~8`") + 3);
    }

    if (results.contains("`8`")) {
      return results.substring(results.indexOf("`8`") + 3);
    }
    if (results.contains("`8~")) {
      return results.substring(results.indexOf("`8~") + 3);
    }
    if (results.contains("~*`")) {
      return results.substring(results.indexOf("~*`") + 3);
    }
    if (results.contains("~*~")) {
      return results.substring(results.indexOf("~*~") + 3);
    } else {
      return results;
    }
  }
}

class HeaderController extends GetxController {
  RxList headerTitle = [
    "Panel Admin Jawara",
    "Datar Barang",
    "Stok Keluar",
    "Stok Masuk",
    "Orderan WA"
  ].obs;
  var headerIndex = 0.obs;
  changeHeaderIndex(index) {
    return HeaderController().headerIndex.value = index;
  }
}

class InputController extends GetxController {
  final InputFormKey = GlobalKey<FormState>();
  final kodeController = TextEditingController();

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    kodeController.text = 'OMHALDBK';
    super.onInit();
  }

  String inputRes(results) {
    if (results.contains("~*~")) {
      return results.substring(results.indexOf("~*~") + 3);
    }
    if (results.contains("`*`")) {
      return results.substring(results.indexOf("`*`") + 3);
    }
    if (results.contains("`*~")) {
      return results.substring(results.indexOf("`*~") + 3);
    }
    if (results.contains("~8`")) {
      return results.substring(results.indexOf("~8`") + 3);
    }

    if (results.contains("`8`")) {
      return results.substring(results.indexOf("`8`") + 3);
    }
    if (results.contains("`8~")) {
      return results.substring(results.indexOf("`8~") + 3);
    }
    if (results.contains("~*`")) {
      return results.substring(results.indexOf("~*`") + 3);
    }
    if (results.contains("~*~")) {
      return results.substring(results.indexOf("~*~") + 3);
    } else {
      return results;
    }
  }

  @override
  void onClose() {
    kodeController.dispose();
    super.onClose();
  }

  void submit() {
    kodeController.clear();
  }
}

// class AddList extends GetxController {
//   final addListFormKey = GlobalKey<FormState>();
//   final kode = TextEditingController();
//   final item = TextEditingController();
//   final stok = TextEditingController();

// }
