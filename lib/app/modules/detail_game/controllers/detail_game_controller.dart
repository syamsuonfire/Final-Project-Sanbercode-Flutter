import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailGameController extends GetxController {
  var isDataLoading = false.obs;
  Map<String, dynamic>? data;

  @override
  void onInit() {
    super.onInit();
    getJsonData();
  }

  Future<void> getJsonData() async {
    try {
      isDataLoading(true);

      final id = Get.arguments;
      http.Response response = await http.get(
          Uri.parse(
              "https://backendexample.sanbersy.com/api/data-game/${id.toString()}"),
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
