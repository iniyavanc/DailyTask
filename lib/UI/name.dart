import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SearchController extends GetxController {
  var searchController = TextEditingController();
  var isLoading = false.obs;
  var searchResults = [].obs;

  void getSearch() async {
    isLoading.value = true;
    var searchQuery = searchController.text.toString();
    var url = "https://dummyjson.com/products/search?q=$searchQuery";
    print("USERDATA:$url");
    print("123454:$searchQuery");

    var response = await _connect.getSearchCall(url);

    if (response != null) {
      var responseData = response.toJson();
      print('getSearchResponse:$responseData');

      // Process and sort the search results
      var results = responseData['products'];
      results.sort((a, b) {
        bool aContainsQuery = a['name'].contains(searchQuery);
        bool bContainsQuery = b['name'].contains(searchQuery);
        if (aContainsQuery && !bContainsQuery) {
          return -1;
        } else if (!aContainsQuery && bContainsQuery) {
          return 1;
        } else {
          return 0;
        }
      });

      searchResults.value = results;
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
    }
  }
}

class SearchScreen extends StatelessWidget {
  final SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                controller.getSearch();
              },
              onTap: () {},
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    var item = controller.searchResults[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text(item['description']),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// Simulate the _connect.getSearchCall function (for demonstration purposes)
class _connect {
  static Future<dynamic> getSearchCall(String url) async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    return {
      'products': [
        {'name': 'Apple iPhone', 'description': 'Latest model of iPhone'},
        {'name': 'Samsung Galaxy', 'description': 'Latest model of Galaxy'},
        {'name': 'Google Pixel', 'description': 'Latest model of Pixel'},
      ]
    };
  }
}
