import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesTabController extends GetxController {
  List? data;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getJsonData();
  }

  Future<void> getJsonData() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.parse("https://backendexample.sanbersy.com/api/data-movie"),
          headers: {"Accept": "aplication/json"});

      var result = jsonDecode(response.body);
      data = result;
    } catch (e) {
    } finally {
      isDataLoading(false);
    }
  }

  Future<void> getRefreshData() async {
    getJsonData();
  }
}
