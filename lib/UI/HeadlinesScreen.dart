import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:saasakitask/Components/AppTheme.dart';
import '../Controller/HeadlinesController.dart';
import 'package:intl/intl.dart';

class HeadlinesScreen extends GetView<HeadlinesController> {
  const HeadlinesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HeadlinesController controller = Get.put(HeadlinesController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: GestureDetector(
          onTap: () {
            for (int i = 0; i < controller.listOnClick.length; i++) {
              if (controller.listOnClick[i] == true) {
                controller.isClicked.value = true;
                // Get.toNamed(AppRoutes.vastuConsultingPaymentScreen.toName);
              }
            }
            if (!controller.isClicked.value) {
              Fluttertoast.showToast(
                msg: 'Please Select Payment',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
              );
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: Center(
              child: Text(
                'SUBMIT',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
                color: AppTheme.appBlueColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'News Today',
                    style: TextStyle(
                        color: AppTheme.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  LiveTimeDisplay(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(top: 10),
                itemCount: 10,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return topCategories(context, index);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Latest News',
                    style: TextStyle(
                      color: AppTheme.textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Top Stories of the moment',
                    style: TextStyle(
                        color: AppTheme.textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: const Divider(
                color: Colors.grey,
                thickness: 0,
              ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: Container(
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 10),
                          itemCount: controller.headlinesData.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return productList(context, index);
                          },
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productList(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HeadlinesController controller = Get.put(HeadlinesController());
    return Column(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              for (int i = 0; i < controller.listOnClick.length; i++) {
                if (index == i) {
                  controller.listOnClick[index] =
                      !controller.listOnClick[index];
                } else {
                  controller.listOnClick[i] = false;
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              decoration: BoxDecoration(
                color: controller.listOnClick[index]
                    ? AppTheme.appBlack
                    : AppTheme.white,
                borderRadius: BorderRadius.circular(5.5),
                border: Border.all(color: AppTheme.white, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.8,
                          child: Text(
                            controller.headlinesData[index].title.toString() ??
                                '',
                            style: const TextStyle(
                                color: AppTheme.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              "assets/images/share.svg",
                              width: 15,
                              color: AppTheme.textColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.headlinesData[index].source!.name
                                      .toString() ??
                                  '',
                              style: const TextStyle(
                                  color: AppTheme.textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2)),
                        height: height * 0.05,
                        width: width * 0.12,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.network(
                            controller.headlinesData[index].urlToImage
                                    .toString() ??
                                '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Divider(
            thickness: 0,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget topCategories(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HeadlinesController controller = Get.put(HeadlinesController());
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 55,
                    width: 55,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'All',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class LiveTimeDisplay extends StatefulWidget {
  @override
  _LiveTimeDisplayState createState() => _LiveTimeDisplayState();
}

class _LiveTimeDisplayState extends State<LiveTimeDisplay> {
  late Timer _timer;
  late String _currentTime;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    setState(() {
      _currentTime = _formatTime(DateTime.now());
    });
  }

  String _formatTime(DateTime time) {
    return DateFormat('h:mm:ss a').format(time);
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        '${(now.day)}th ${_getMonthName(now.month)} ${now.year} ';
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$formattedDate',
              style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }

  // Widget productList1(BuildContext context, int index) {
  //   double height = MediaQuery.of(context).size.height;
  //   double width = MediaQuery.of(context).size.width;
  //   ProductScreenController controller = Get.put(ProductScreenController());
  //   return Column(
  //     children: [
  //       Container(
  //         //margin: EdgeInsets.only(left: 15, right: 15, top: 10),
  //         width: width,
  //         height: height * 0.15,
  //         decoration: BoxDecoration(
  //           color: AppTheme.liteBlack,
  //           borderRadius: BorderRadius.circular(5),
  //           border: Border.all(color: AppTheme.primaryColor, width: 2),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Column(
  //                   children: [
  //                     Container(
  //                       margin: EdgeInsets.only(bottom: 10, left: 20),
  //                       decoration: BoxDecoration(
  //                         border: Border.all(
  //                           color: AppTheme.liteBlack,
  //                           width: 1,
  //                         ),
  //                         borderRadius: BorderRadius.circular(20),
  //                       ),
  //                       child: CircleAvatar(
  //                         radius: 20,
  //                         backgroundImage:
  //                             AssetImage("assets/images/Ellipse 69.png"),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Container(
  //                   width: width * 0.43,
  //                   margin: EdgeInsets.only(left: 10),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(height: 18),
  //                       Container(
  //                         width: width * 0.7,
  //                         child: Text(
  //                           '123',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 15,
  //                             fontWeight: FontWeight.w400,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
