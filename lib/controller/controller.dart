import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScannerController extends GetxController {
  RxString hasil = "".obs;

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

  @override
  void onClose() {
    kodeController.dispose();
    super.onClose();
  }

  void submit() {
    kodeController.clear();
  }
}
