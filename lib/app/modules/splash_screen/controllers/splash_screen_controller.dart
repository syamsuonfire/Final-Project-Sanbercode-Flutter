import 'package:finalproject_moviegames/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    autoLogin();
    super.onInit();
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString("user-token");
    if (userToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.MAIN_SCREEN);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.LOGIN_SCREEN);
      });
    }
  }
}
