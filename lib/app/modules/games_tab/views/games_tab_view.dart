// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/games_tab_controller.dart';

class GamesTabView extends GetView<GamesTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Game'),
        centerTitle: true,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.getRefreshData,
          child: controller.isDataLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1.5 / 2,
                      crossAxisSpacing: 2.5,
                      mainAxisSpacing: 2.5,
                    ),
                    itemCount:
                        controller.data == null ? 0 : controller.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/detail-game',
                              arguments: controller.data![index]["id"]);
                        },
                        child: Card(
                          elevation: 20,
                          color: Colors.white,
                          margin: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.transparent,
                                  width: 4.0,
                                  style: BorderStyle.solid), //Border.all
                              /*** The BorderRadius widget  is here ***/
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: (controller.data![index]["image_url"] == "")
                                ? CircularProgressIndicator()
                                : Image.network(
                                    controller.data![index]["image_url"],
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
