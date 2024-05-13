import 'dart:collection';

import 'package:get/get.dart';
import '../ApiConnect/ApiConnect.dart';
import '../ResponseModel/CountryResponse.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../UI/MainScreen.dart';

class MainScreenController extends GetxController {
  ApiConnect _connect = Get.put(ApiConnect());
  RxString continentsDropDown = RxString('Continents');
  RxBool isLoading = RxBool(false);

  late CountryResponse responseData;
  List<CountryList> apiResult = [];
  Set<String> continents = HashSet<String>();

  @override
  Future<void> onInit() async {
    super.onInit();
    // getCountry();
    // apiResult = await fetchCountries(http.Client());
    // print("vales:${apiResult[0].region}");
    // List<String> continents = getRegionList(apiResult);
  }

  // List<String> continents = getRegionList(apiResult);

  List<List<String>> countries = [
    ['China', 'India', 'Japan', 'South Korea'],
    ['Nigeria', 'Ethiopia', 'Egypt', 'DR Congo'],
    ['Germany', 'France', 'UK', 'Italy'],
    ['USA', 'Canada', 'Mexico'],
    ['Brazil', 'Argentina', 'Colombia'],
    ['Australia', 'New Zealand'],
  ];

  // getCountry() async {
  //   isLoading.value = true;
  //   var response = await _connect.getCountryCall();
  //   isLoading.value = false;
  //   if (response != null) {
  //     responseData = CountryResponse.fromJson(json.decode(response));
  //     for (int i = 0; i < responseData.length; i++) {
  //       if (continents.contains(response.region)) {}
  //     }
  //   } else {}
  // }

  RxList<Name> nameValues = RxList();

// Name? ;
// RxList<Name> nameValues=RxList();
// Future<Map<String, String>> getCountry() async {
//   final url = Uri.parse('https://restcountries.com/v3.1/all');
//   final response = await http.get(url);
//   print('Object: $url');
//   print('Object1: ${response.toString()}');
//   if (response.statusCode == 200) {
//     CountryResponse data =
//         CountryResponse.fromJson(json.decode(response.body));
//     nameValues = data.name!;
//     print('1234: $data');
//     final result1 = json.decode(response.body);
//     print('alldata: $result1');
//     List<dynamic> items = result1['result'];
//     String itemName = items[0]['name'];
//     print('ItemName: $itemName');
//     return result1;
//   } else {
//     throw Exception('');
//   }
// }

// Future<List<dynamic>> getCountry() async {
//   isLoading.value = true;
//   final url = Uri.parse('https://restcountries.com/v3.1/all');
//   final response = await http.get(url);
//   print('Object: $url');
//   print('Object1: ${response.toString()}');
//   if (response.statusCode == 200) {
//     final List<dynamic> result = json.decode(response.body);
//     isLoading.value = false;
//
//     responseData = print('alldata: ${result[0]}');
//     List<Name> names = [];
//     for (var item in result) {
//       Name name = Name.fromJson(item);
//       names.add(name);
//     }
//     nameValues.assignAll(names);
//
//     return result;
//   } else {
//     throw Exception('');
//   }
// }
}

class CountryList {
  final String name;

  // final String capital;
  final String region;

  // final String subregion;
  final String flags;
  final int population;

  const CountryList({
    required this.name,
    // required this.capital,
    required this.region,
    // required this.subregion,
    required this.flags,
    required this.population,
  });

  factory CountryList.fromJson(Map<String, dynamic> json) {
    return CountryList(
      name: json['name']['common'] as String,
      // capital: json['capital'][0] as String,
      region: json['region'] as String,
      // subregion: json['subregion'] as String,
      flags: json['flags']['png'] as String,
      population: json['population'] as int,
    );
  }
}
