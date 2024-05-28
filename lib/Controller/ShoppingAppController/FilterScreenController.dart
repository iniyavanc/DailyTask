import 'package:get/get.dart';

class FilterScreenController extends GetxController {
  RxBool priceOnClick = RxBool(false);
  RxList<bool> isCheck = List<bool>.filled(3, false).obs;
  // RxBool isCheck = RxBool(false);

  List<String> items = [
    "30,000-40,000(6)",
    "30,000-40,000(15)",
    "30,000-40,000(10)"
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
