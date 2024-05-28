import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saasakitask/ResponseModel/CountryResponse.dart';
import 'package:saasakitask/ResponseModel/GetProductDetailsResponse.dart';

import '../ResponseModel/GetAllProductsResponse.dart';
import '../ResponseModel/HeadlinesResponse.dart';
import '../ResponseModel/SearchResponse.dart';

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

  Future<GetAllProductsResponse> getProductCall() async {
    var response = await get('https://dummyjson.com/products');
    if (response.body == null) throw Exception('no data');
    print(response.body);
    return GetAllProductsResponse.fromJson(response.body);
  }

  Future<SearchResponse> getSearchCall(String endPoint) async {
    var response = await get(endPoint);
    if (response.body == null) throw Exception('no data');
    print(response.body);
    return SearchResponse.fromJson(response.body);
  }

  Future<GetProductDetailsResponse> getProductDetailsCall(String id) async {
    var response = await get(id);
    if (response.body == null) throw Exception('no data');
    print(response.body);
    return GetProductDetailsResponse.fromJson(response.body);
  }
}
