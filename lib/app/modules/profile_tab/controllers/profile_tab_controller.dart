import 'package:dio/dio.dart';
import 'package:finalproject_moviegames/app/config/dio_http.dart';
import 'package:finalproject_moviegames/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTabController extends GetxController {
  var isDataLoading = false.obs;
  String? userToken;
  String? email;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      isDataLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userToken = prefs.getString("user-token");
      email = prefs.getString("email");
    } catch (e) {
    } finally {
      isDataLoading(false);
    }
  }

  Future<dynamic> logout() async {
    try {
      var response = await DioHttp.request.post("/api/logout",
          options: Options(headers: {"authorization": "Bearer $userToken"}));

      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      Get.offNamed(Routes.LOGIN_SCREEN);
    } catch (e) {}
  }

  Future<void> getRefreshData() async {
    getProfile();
  }
}
