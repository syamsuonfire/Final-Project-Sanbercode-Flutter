import 'package:dio/dio.dart';
import 'package:finalproject_moviegames/app/config/dio_http.dart';
import 'package:finalproject_moviegames/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  RxBool passwordVisible = true.obs;

  togglePassword() {
    passwordVisible.isTrue
        ? passwordVisible.value = false
        : passwordVisible.value = true;
  }

  Future<void> login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        var data = {"email": emailC.text, "password": passwordC.text};
        var response = await DioHttp.request.post("api/user-login", data: data);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user-token', response.data["token"]);
        prefs.setString('email', emailC.text);

        Get.offAllNamed(Routes.MAIN_SCREEN);
        Get.snackbar("Congratulation!", "Success login");
      } on DioError catch (dioError) {
        switch (dioError.response!.statusCode) {
          case 400:
            Get.snackbar("Terjadi Kesalahan",
                dioError.response!.data["error"].toString());
            break;
          case 404:
            Get.snackbar("Terjadi Kesalahan", "User Not Found");
            break;
          default:
            Get.snackbar("Terjadi Kesalahan", "Server Error");
        }
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Email dan password wajib diisi.");
    }
  }
}
