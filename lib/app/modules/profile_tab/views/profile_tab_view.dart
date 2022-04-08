// ignore_for_file: prefer_const_constructors

import 'package:finalproject_moviegames/app/modules/profile_tab/controllers/profile_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTabView extends GetView<ProfileTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Page"),
          centerTitle: true,
        ),
        body: Obx(() => RefreshIndicator(
              onRefresh: controller.getRefreshData,
              child: controller.isDataLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      padding: EdgeInsets.all(20),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image.asset(
                            "assets/img/blank.png",
                            height: 150,
                            width: 150,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${controller.email}".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${controller.email}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.person),
                          title: Text("Update Profile"),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.vpn_key),
                          title: Text("Update Password"),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout();
                          },
                          leading: Icon(Icons.logout),
                          title: Text("Logout"),
                        ),
                      ],
                    ),
            )));
  }
}
