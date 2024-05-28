import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saasakitask/Routes/AppRoutes.dart';
import '../../ApiConnect/ApiConnect.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../ResponseModel/GetAllProductsResponse.dart';
import '../../ResponseModel/GetProductDetailsResponse.dart';
import '../../ResponseModel/SearchResponse.dart';

class ProductScreenController extends GetxController {
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  RxBool isLoadingMore = RxBool(false);
  RxList<Products> productData = RxList();
  RxList<SearchProducts> searchProductData = RxList();
  RxBool isSearch = RxBool(false);
  TextEditingController searchController = TextEditingController();
  late MenuDataProvider userDataProvider;
  GetProductDetailsResponse productDetailsData = GetProductDetailsResponse();
  RxInt page = RxInt(1);
  RxInt totalPage = RxInt(0);
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() async {
    isLoading.value = true;
    var response = await _connect.getProductCall();
    isLoading.value = false;
    print('getAllProductsResponse:${response.toJson()}');
    if (response != null) {
      productData.value = response.products!;
    } else {}
  }

  getSearch() async {
    isLoading.value = true;
    var response = await _connect.getSearchCall(
        "https://dummyjson.com/products/search?q=${searchController.text.toString()}");
    var url =
        "https://dummyjson.com/products/search?q=${searchController.text.toString()}";
    print("USERDATA:$url");
    print("123454:${searchController.text.toString()}");
    print('getSearchResponse:${response.toJson()}');
    if (response != null) {
      searchProductData.value =response.products!;
      isLoading.value = false;
      update();
    } else {}
  }

  getProductDetails() async {
    isLoading.value = true;
    print("123454:${searchController.text.toString()}");
    var response = await http.get(Uri.parse(
        'https://dummyjson.com/products/search?q=${productData[0].id.toString()}'));
    isLoading.value = false;
    final result = json.decode(response.body);
    if (response != null) {
      productDetailsData = GetProductDetailsResponse.fromJson(result);
      userDataProvider.setProductDetailsData(productDetailsData);
      Get.offNamed(AppRoutes.productDetailScreen.toName);
    } else {}
  }

  Future<void> get1ProductDetails() async {
    isLoading.value = true;

    print("123454:${searchController.text.toString()}");
    var response = await http.get(Uri.parse(
        'https://dummyjson.com/products/search?q=${productData[0].id.toString()}'));
    isLoading.value = false;
    print('get1ProductDetails:${response.body}');

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      // Ensure that the result is not null and has the expected structure
      if (result != null && result is Map<String, dynamic>) {
        productDetailsData = GetProductDetailsResponse.fromJson(result);
        userDataProvider.setProductDetailsData(productDetailsData);
        Get.offNamed(AppRoutes.productDetailScreen.toName);
        print(
            'getValues:${userDataProvider.getProductDetailData!.rating.toString()}');
      } else {
        throw Exception("Invalid JSON structure");
      }
    } else {
      throw Exception("Failed to load product details");
    }
  }
}

// var response = await _connect.getSearchCall(
//     "https://dummyjson.com/products/search?q=${productData[0].id.toString()}");

// productDetailsData =
//     GetProductDetailsResponse.fromJson(json.decode(response.toString()));
