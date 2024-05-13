import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saasakitask/ResponseModel/CountryResponse.dart';

import '../ResponseModel/HeadlinesResponse.dart';

class ApiConnect extends GetConnect {
  @override
  void onInit() {
    super.allowAutoSignedCert = true;
    super.onInit();
    httpClient.addResponseModifier((request, response) {
      debugPrint("------------ AUTH ------------");
      debugPrint(
          "REQUEST METHOD: ${request.method} ; ENDPOINT:  ${request.url}");
      debugPrint("RESPONSE : ${response.bodyString}");
      return response;
    });
  }

  Future<CountryResponse> getCountryCall() async {
    var response = await get('https://restcountries.com/v3.1/all');
    print("responseConnect:$response");
    if (response.body == null) throw Exception('no data');
    print(response.body);
    return CountryResponse.fromJson(response.body);
  }

  Future<HeadlinesResponse> getHeadlinesCall() async {
    var response = await get(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=d2eccaadb59e4fa0b3275a828607f722');
    print("responseConnect:$response");
    if (response.body == null) throw Exception('no data');
    print(response.body);
    return HeadlinesResponse.fromJson(response.body);
  }
}
