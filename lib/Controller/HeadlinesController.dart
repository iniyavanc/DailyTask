import 'dart:async';
import 'package:get/get.dart';
import '../ApiConnect/ApiConnect.dart';
import '../ResponseModel/HeadlinesResponse.dart';

class HeadlinesController extends GetxController {
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  RxList<Articles> headlinesData = RxList();
  RxList<bool> listOnClick = RxList();
  RxBool isClicked = RxBool(false);

  late Timer _timer;
  late String _currentTime;
  @override
  void onInit() {
    getHeadlines();
    super.onInit();
  }

  getHeadlines() async {
    isLoading.value = true;
    var response = await _connect.getHeadlinesCall();
    isLoading.value = false;
    print('getResponse:${response.toJson()}');
    if (response != null) {
      headlinesData.value = response.articles!;
      for (int i = 0; i < response.articles!.length; i++) {
        listOnClick.add(false);
      }
    } else {}
  }
}
