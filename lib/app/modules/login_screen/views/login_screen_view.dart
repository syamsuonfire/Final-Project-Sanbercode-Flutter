// ignore_for_file: prefer_const_constructors

import 'package:finalproject_moviegames/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/img/logo.png",
                height: 150,
                width: 150,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: controller.emailC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email ",
                    prefixIcon: Icon(
                      Icons.email,
                      size: 18,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Obx(() => TextField(
                    obscureText: controller.passwordVisible.value,
                    controller: controller.passwordC,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        prefixIcon: Obx(() => IconButton(
                              onPressed: () {
                                controller.togglePassword();
                              },
                              icon: Icon(
                                (controller.passwordVisible.isFalse)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 18,
                              ),
                            ))),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Obx(() => ElevatedButton(
                      // textColor: Colors.white,
                      style: raisedButtonStyle,
                      child: Text(controller.isLoading.isFalse
                          ? "Login"
                          : "Loading..."),
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.login();
                        }
                      },
                    ))),
            SizedBox(
              height: 15,
            ),
            Container(
                child: Row(children: <Widget>[
              Text("   Does not have account?"),
              TextButton(
                  // textColor: Colors.blue,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER_SCREEN);
                  })
            ]))
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
  primary: Colors.blue[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);
