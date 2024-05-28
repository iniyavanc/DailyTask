import 'package:get/get.dart';
import '../../Controller/ShoppingAppController/ProductDetailsScreenController.dart';

class ProductDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsScreenController>(
        () => ProductDetailsScreenController());
  }
}
