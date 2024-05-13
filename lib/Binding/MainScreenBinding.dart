import 'package:get/get.dart';

import '../Controller/MainScreenController.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController());
  }
}
