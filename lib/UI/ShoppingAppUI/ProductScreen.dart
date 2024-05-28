import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:saasakitask/Components/AppTheme.dart';
import '../../Controller/ShoppingAppController/ProductScreenController.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../Routes/AppRoutes.dart';
import 'FilterScreen.dart';

class ProductScreen extends GetView<ProductScreenController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductScreenController controller = Get.put(ProductScreenController());
    controller.userDataProvider =
        Provider.of<MenuDataProvider>(context, listen: false);

    ScrollController scrollController = ScrollController();

    void scrollListener() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (controller.page.value < controller.totalPage.value) {
          controller.page.value++;
          controller.getAllProducts();
        }
      }
    }

    return Scaffold(
        backgroundColor: AppTheme.darkBlack,
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0.0,
          automaticallyImplyLeading: false,
          toolbarHeight: 55,
          backgroundColor: AppTheme.darkBlack,
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: const Row(
            children: [
              Text(
                'Delivery to',
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' 12345',
                style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.liteGreen,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
          actions: <Widget>[],
          centerTitle: false,
        ),
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: width * 0.93,
                  decoration: BoxDecoration(
                    color: AppTheme.liteBlack,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppTheme.liteBlack,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.search_sharp, size: 25, color: Colors.white),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            controller.isSearch.value = true;
                            controller.getSearch();
                          },
                          onTap: () {},
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Obx(() => Visibility(
                          visible: controller.isSearch.value,
                          child: InkWell(
                              onTap: () {
                                controller.isSearch.value = false;
                                controller.isLoading.value = true;
                                controller.isLoading.value = false;
                                controller.searchController.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.cancel_sharp,
                                    size: 25, color: Colors.white),
                              )))),
                      // Icon(Icons.cancel_sharp, size: 25, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilterScreen()));
                  },
                  child: Container(
                    height: 35,
                    width: 55,
                    decoration: BoxDecoration(
                        color: AppTheme.darkBlack,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme.liteBlack)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppTheme.liteGreen),
                          child: Text(
                            textAlign: TextAlign.center,
                            '4',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Center(
                          child: Image.asset("assets/images/flitter.png",
                              fit: BoxFit.fill,
                              width: 15,
                              height: 15,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 60,
                    decoration: BoxDecoration(
                        color: AppTheme.darkBlack,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme.liteBlack)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Sort',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            size: 25, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                        color: AppTheme.darkBlack,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme.liteBlack)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Brand',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            size: 25, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        color: AppTheme.darkBlack,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme.liteBlack)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Delivery Mode',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            size: 25, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: AppTheme.liteBlack,
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '158 Products',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.liteBlack),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Obx(
          //   () =>

          // Obx(() {
          //   if (controller.isLoading.value) {
          //     return Center(child: CircularProgressIndicator());
          //   } else {
          //     return Expanded(
          //       child: NotificationListener<ScrollNotification>(
          //         onNotification: (ScrollNotification scrollInfo) {
          //           if (!controller.isLoadingMore.value &&
          //               scrollInfo.metrics.pixels ==
          //                   scrollInfo.metrics.maxScrollExtent) {
          //             // If we are at the bottom of the list, load more data
          //             controller.getAllProducts(
          //                 skip: controller.productData.length);
          //           }
          //           return false;
          //         },
          //         child: ListView.builder(
          //           padding: EdgeInsets.only(bottom: 10),
          //           itemCount: controller.productData.length + 1,
          //           shrinkWrap: true,
          //           physics: const AlwaysScrollableScrollPhysics(),
          //           itemBuilder: (context, index) {
          //             if (index < controller.productData.length) {
          //               return productList(context, index);
          //             } else {
          //               // Show loading indicator at the bottom
          //               return Center(child: CircularProgressIndicator());
          //             }
          //           },
          //         ),
          //       ),
          //     );
          //   }
          // }),

          Obx(() => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: Container(
                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 10),
                          itemCount: controller.isSearch.value == true
                              ? controller.searchProductData.length
                              : controller.productData.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return controller.isSearch.value == true
                                ? searchList(context, index)
                                : productList(context, index);
                          })

                      // )

                      ),
                ))
        ]));
  }

  Widget productList(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductScreenController controller = Get.put(ProductScreenController());
    var values = controller.productData[index];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.userDataProvider
                .setProductData(controller.productData[index]);
            Get.offNamed(AppRoutes.productDetailScreen.toName);

            // controller.get1ProductDetails();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: AppTheme.darkBlack,
                borderRadius: BorderRadius.circular(5.5),
                border: Border.all(color: AppTheme.darkBlack, width: 0)),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.liteBlack,
                              borderRadius: BorderRadius.circular(5)),
                          height: height * 0.21,
                          width: width * 0.3,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Card(
                                      elevation: 1,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.01),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                              )
                                            ],
                                            border: Border.all(
                                                color: AppTheme.liteBlack,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppTheme.liteBlack),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: Image.network(
                                    values.thumbnail.toString() ?? "",
                                    fit: BoxFit.fill,
                                    height: height * 0.12,
                                    width: width * 0.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.darkBlack,
                              borderRadius: BorderRadius.circular(5)),
                          height: height * 0.21,
                          width: width * 0.55,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    values.rating.toString() ?? "",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: AppTheme.liteGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '374 ratings',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      values.title.toString() ?? "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$${values.price.toString() ?? ""}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '₹53,666',
                                    style: TextStyle(
                                        decorationColor: Colors.white,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppTheme.liteBlack)),
                                    child: Text(
                                      ' ${values.discountPercentage.toString() ?? ""}%OFF ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.liteBlack,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppTheme.liteBlack)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.card_giftcard,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Earn up to 750 NeuCoins',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: AppTheme.liteBlack,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: AppTheme.liteBlack)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SvgPicture.asset(
                                        "assets/images/delivery.svg",
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Delivery by 18 May',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFBBDEFA),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFBBDEFA),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              '7050 off payment OTP page',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF28618E),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFF28618E),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              '6M No Cost EMI',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Divider(
          color: AppTheme.liteBlack,
          thickness: 1,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget searchList(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductScreenController controller = Get.put(ProductScreenController());
    var values = controller.searchProductData[index];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // controller.userDataProvider
            //     .setProductData(controller.productData[index]);
            // Get.offNamed(AppRoutes.productDetailScreen.toName);

            // controller.get1ProductDetails();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: AppTheme.darkBlack,
                borderRadius: BorderRadius.circular(5.5),
                border: Border.all(color: AppTheme.darkBlack, width: 0)),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.liteBlack,
                              borderRadius: BorderRadius.circular(5)),
                          height: height * 0.21,
                          width: width * 0.3,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Card(
                                      elevation: 1,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.01),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                              )
                                            ],
                                            border: Border.all(
                                                color: AppTheme.liteBlack,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppTheme.liteBlack),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: Image.network(
                                    values.thumbnail.toString() ?? "",
                                    fit: BoxFit.fill,
                                    height: height * 0.12,
                                    width: width * 0.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.darkBlack,
                              borderRadius: BorderRadius.circular(5)),
                          height: height * 0.21,
                          width: width * 0.55,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    values.rating.toString() ?? "",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: AppTheme.liteGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '374 ratings',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      values.title.toString() ?? "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$${values.price.toString() ?? ""}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '₹53,666',
                                    style: TextStyle(
                                        decorationColor: Colors.white,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppTheme.liteBlack)),
                                    child: Text(
                                      ' ${values.discountPercentage.toString() ?? ""}%OFF ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.liteBlack,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppTheme.liteBlack)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.card_giftcard,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Earn up to 750 NeuCoins',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: AppTheme.liteBlack,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: AppTheme.liteBlack)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SvgPicture.asset(
                                        "assets/images/delivery.svg",
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Delivery by 18 May',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFBBDEFA),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFBBDEFA),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              '7050 off payment OTP page',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF28618E),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFF28618E),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              '6M No Cost EMI',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Divider(
          color: AppTheme.liteBlack,
          thickness: 1,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
