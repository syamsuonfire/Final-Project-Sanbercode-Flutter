// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
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
                "Register",
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
                controller: controller.nameC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name ",
                    prefixIcon: Icon(
                      Icons.people,
                      size: 18,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: controller.emailC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      size: 18,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
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
                          ? "Register"
                          : "Loading..."),
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.register();
                        }
                      },
                    ))),
            SizedBox(
              height: 15,
            ),
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
