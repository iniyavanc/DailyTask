import 'package:get/get.dart';

import '../../Controller/ShoppingAppController/ProductScreenController.dart';

class ProductScreenBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<ProductScreenController>(() => ProductScreenController());
  }

}