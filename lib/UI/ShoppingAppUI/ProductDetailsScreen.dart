import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Components/AppTheme.dart';
import '../../Components/Button.dart';
import '../../Controller/ShoppingAppController/ProductDetailsScreenController.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../Routes/AppRoutes.dart';

class ProductDetailsScreen extends GetView<ProductDetailsScreenController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductDetailsScreenController controller =
        Get.put(ProductDetailsScreenController());
    controller.userDataProvider =
        Provider.of<MenuDataProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppTheme.darkBlack,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0.0,
        automaticallyImplyLeading: false,
        toolbarHeight: 55,
        backgroundColor: AppTheme.darkBlack,
        leading: GestureDetector(
          onTap: () {
            Get.offNamed(AppRoutes.productScreen.toName);
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'Product Details',
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.network(
              controller.userDataProvider.getProductData!.thumbnail ?? "",
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    controller.userDataProvider.getProductData!.title ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.liteGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: AppTheme.liteGreen,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: AppTheme.liteGreen,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: AppTheme.liteGreen,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    controller.userDataProvider.getProductData!.rating
                        .toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppTheme.liteGreen),
                    child: Icon(
                      CupertinoIcons.minus,
                      color: AppTheme.white,
                      size: 19,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppTheme.liteGreen),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                // Icon(
                //   Icons.keyboard_arrow_down_outlined,
                //   size: 30,
                //   color: Colors.black,
                // )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    controller.userDataProvider.getProductData!.description
                        .toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text:
                        '\$${controller.userDataProvider.getProductData!.price.toString()}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                    ),
                  )
                ])),
                SizedBox(
                  width: 90,
                ),
                // Button(
                //   widthFactor: 0.4,
                //   heightFactor: 0.06,
                //   onPressed: () {
                //     // Navigator.push(context,
                //     //     MaterialPageRoute(builder: (context) => LoginScreen()));
                //   },
                //   child: Text('Add to Cart',
                //       style: TextStyle(
                //         fontSize: 18,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w600,
                //       )),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                widthFactor: 0.4,
                heightFactor: 0.06,
                onPressed: () {},
                child: Text('Add to Cart',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Button(
                widthFactor: 0.4,
                heightFactor: 0.06,
                onPressed: () {},
                child: Text('Buy Now',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
