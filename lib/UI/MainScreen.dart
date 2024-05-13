import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saasakitask/Components/AppTheme.dart';
import '../Controller/MainScreenController.dart';
import 'package:http/http.dart' as http;

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController controller = Get.put(MainScreenController());
    int _expandedIndex = -1;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.5,
          //   child: ListView.builder(
          //     itemCount: controller.continents.length,
          //     itemBuilder: (context, index) {
          //       return ExpandableNotifier(
          //         child: Padding(
          //           padding: const EdgeInsets.all(10),
          //           child: Card(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(5.5),
          //                 side: BorderSide(color: AppTheme.appColor)),
          //             elevation: 0,
          //             clipBehavior: Clip.antiAlias,
          //             child: Column(
          //               children: [
          //                 ExpandablePanel(
          //                   theme: ExpandableThemeData(
          //                     iconColor: AppTheme.appColor,
          //                   ),
          //                   header: GestureDetector(
          //                     onTap: () {
          //                       _expandedIndex =
          //                           _expandedIndex == index ? -1 : index;
          //                     },
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10),
          //                       child: Text(
          //                         controller.continents[index],
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.w600,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   collapsed: Container(),
          //                   expanded: Container(
          //                     padding: EdgeInsets.all(10),
          //                     child: Column(
          //                       children: controller.countries[index]
          //                           .map((country) => ListTile(
          //                                 title: Text(country),
          //                               ))
          //                           .toList(),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget countryList(
    BuildContext context,
    int index,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    MainScreenController controller = Get.put(MainScreenController());
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // width: +width,
          // height: height * 0.15,
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(5.5),
            border: Border.all(color: AppTheme.appColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Column(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(bottom: 10, left: 20),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: AppTheme.appColor,
                  //           width: 1,
                  //         ),
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //       child: CircleAvatar(
                  //         radius: 20,
                  //         backgroundImage:
                  //             AssetImage("assets/images/Ellipse 69.png"),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Container(
                    width: width * 0.43,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18),
                        Container(
                          width: width * 0.7,
                          child: Text(
                            controller.nameValues[index].common.toString() ??
                                '',
                            style: TextStyle(
                              color: AppTheme.appBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.7,
                          child: Text(
                            '12',
                            style: TextStyle(
                              color: AppTheme.appBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.8,
                          child: Text(
                            '12',
                            style: TextStyle(
                              color: AppTheme.appBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

List<CountryList> parseCountries(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
  return parsed.map<CountryList>((json) => CountryList.fromJson(json)).toList();
}

Future<List<CountryList>> fetchCountries(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://restcountries.com/v3.1/all'));
  // Synchronously run parsePhotos in the main isolate.
  final countryList = parseCountries(response.body);
  print('CountryResposne:$countryList');
  return countryList;
}

getRegionList(List<CountryList> countries) {
  var regionList = [];
  return regionList;
}

// // countries.forEach((country) {
// if (!regionList.contains(country.region)) {
// regionList.add(country.region);
// }
// // });
