import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Components/AppTheme.dart';
import '../../Controller/ShoppingAppController/FilterScreenController.dart';

class FilterScreen extends GetView<FilterScreenController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    FilterScreenController controller = Get.put(FilterScreenController());
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: AppTheme.white,
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'Filters',
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                "assets/images/cancel.svg",
                color: Colors.black,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black54,
                      size: 25,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.priceOnClick.value =
                              !controller.priceOnClick.value;
                        },
                        child: Icon(
                          controller.priceOnClick.value
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down_rounded,
                          color: Colors.black54,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Obx(() => Visibility(
                  visible: controller.priceOnClick.value,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 0,
                          ),
                          Container(
                            height: height * 0.2,
                            width: width * 0.7,
                            child: ListView.builder(
                              itemCount: controller.items.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Obx(() => ListTile(
                                      title: Text(controller.items[index]),
                                      leading: Checkbox(
                                        value: controller.isCheck[index],
                                        onChanged: (bool? value) {
                                          // controller.isCheck.value =
                                          //     value ?? false;
                                          for (int i = 0;
                                              i < controller.isCheck.length;
                                              i++) {
                                            if (i == index) {
                                              controller.isCheck[i] =
                                                  value ?? false;
                                            } else {
                                              controller.isCheck[i] = false;
                                            }
                                          }
                                        },
                                        activeColor: AppTheme.liteGreen,
                                        checkColor: Colors.white,
                                      ),
                                    ));
                              },
                            ),
                          ),
                          // Obx(
                          //   () => Checkbox(
                          //     activeColor: AppTheme.liteGreen,
                          //     checkColor: Colors.white,
                          //     value: controller.isCheck.value,
                          //     onChanged: (bool? value) {
                          //       controller.isCheck.value = value ?? false;
                          //     },
                          //   ),
                          // ),
                          // Text(
                          //   '30,000-40,000(6)',
                          //   style: TextStyle(
                          //       color: Colors.black54,
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 14),
                          // ),
                        ],
                      ),
                    ],
                  ))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Brand',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Processor Name',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Mode',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Mode',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Color',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Internal Storage(GB)',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  '158 items',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                Spacer(),
                Text(
                  'RESET',
                  style: TextStyle(
                      color: AppTheme.liteGreen,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                SizedBox(
                  width: width * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color(0xFFE3E3E3)),
                    onPressed: () {},
                    child: Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: Text(
                        'APPLY',
                        style: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
