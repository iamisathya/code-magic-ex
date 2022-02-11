import 'package:get/get.dart';

import 'controller/barcode.scan.controller.dart';

class BarcodeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BarcodeScannerController(), fenix: true);
  }
}
