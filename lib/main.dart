import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'Components/AppTheme.dart';
import 'Provider/MenuDataProvider.dart';
import 'Routes/AppPages.dart';
import 'Routes/AppRoutes.dart';
import 'UI/ShoppingAppUI/ProductScreen.dart';
import 'UI/name.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MenuDataProvider>(
      create: (_) => MenuDataProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.darkBlack,
      statusBarIconBrightness: Brightness.light,
    ));
    final ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppTheme.darkBlack,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: ProductScreen(),
      initialRoute: AppRoutes.root.toName,
      getPages: AppPages.list,
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
// // This is the root widget
// // of your application
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GFG(),
//     );
//   }
// }
//
// class GFG extends StatefulWidget {
//   const GFG({Key? key}) : super(key: key);
//
//   @override
//   State<GFG> createState() => _GFGState();
// }
//
// class _GFGState extends State<GFG> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "",
//           ),
//           actions: [
//             Container(
//               height: 50,
//               width: 250,
//               child: TextField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red)),
//                   suffixIcon: Icon(Icons.search),
//                 ),
//                 onTap: () {
//                   //Go to the next screen
//
//                   showSearch(
//                       context: context,
//                       // delegate to customize the search bar
//                       delegate: CustomSearchDelegate());
//                 },
//                 cursorColor: Colors.grey,
//               ),
//             )
//
//             // IconButton(
//             //   onPressed: () {
//             //     showSearch(
//             //         context: context,
//             //         // delegate to customize the search bar
//             //         delegate: CustomSearchDelegate());
//             //   },
//             //   icon: const Icon(Icons.search),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomSearchDelegate extends SearchDelegate {
// // Demo list to show querying
//   List<String> searchTerms = [
//     "Apple",
//     "Banana",
//     "Mango",
//     "Pear",
//     "Watermelons",
//     "Blueberries",
//     "Pineapples",
//     "Strawberries"
//   ];
//
// // first overwrite to
// // clear the search text
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }
//
// // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }
//
// // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
//
// // last overwrite to show the
// // querying process at the runtime
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }
