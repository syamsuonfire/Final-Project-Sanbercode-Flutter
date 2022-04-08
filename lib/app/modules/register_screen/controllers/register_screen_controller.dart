import 'package:dio/dio.dart';
import 'package:finalproject_moviegames/app/config/dio_http.dart';
import 'package:finalproject_moviegames/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreenController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  RxBool passwordVisible = true.obs;

  togglePassword() {
    passwordVisible.isTrue
        ? passwordVisible.value = false
        : passwordVisible.value = true;
  }

  Future<void> register() async {
    if (nameC.text.isNotEmpty &&
        usernameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passwordC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        var data = {
          "name": nameC.text,
          "username": usernameC.text,
          "email": emailC.text,
          "password": passwordC.text
        };
        var response = await DioHttp.request.post("api/register", data: data);

        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('user-token', response.data["token"]);

        Get.snackbar("Congratulation!",
            "Your account successfully registered, please login");
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      } on DioError catch (dioError) {
        switch (dioError.response!.statusCode) {
          case 400:
            Get.snackbar("Terjadi Kesalahan",
                dioError.response!.data["errors"].toString());
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
      Get.snackbar("Terjadi Kesalahan",
          "Nama, username, email dan password wajib diisi.");
    }
  }
}
