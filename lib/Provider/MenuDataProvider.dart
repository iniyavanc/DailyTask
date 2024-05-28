import 'package:flutter/cupertino.dart';
import '../ResponseModel/GetAllProductsResponse.dart';
import '../ResponseModel/GetProductDetailsResponse.dart';

class MenuDataProvider extends ChangeNotifier {
  Products? productData;

  Products? get getProductData => productData;

  GetProductDetailsResponse? productDetailData;

  GetProductDetailsResponse? get getProductDetailData => productDetailData;

  void setProductDetailsData(GetProductDetailsResponse? data) {
    productDetailData = data;
    notifyListeners();
  }

  void setProductData(Products? data) {
    productData = data;
    notifyListeners();
  }
}
