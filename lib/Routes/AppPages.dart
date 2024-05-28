import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Binding/ShoppingAppBinding/ProductDetailsScreenBinding.dart';
import '../Binding/ShoppingAppBinding/ProductScreenBinding.dart';
import '../UI/ShoppingAppUI/ProductDetailsScreen.dart';
import '../UI/ShoppingAppUI/ProductScreen.dart';
import 'AppRoutes.dart';

class AppPages {
  static final List<GetPage> list = [
    GetPage(
        name: AppRoutes.root.toName,
        page: () => ProductScreen(),
        binding: ProductScreenBinding()),
    GetPage(
        name: AppRoutes.productDetailScreen.toName,
        page: () => ProductDetailsScreen(),
        binding: ProductDetailsScreenBinding()),
  ];
}
