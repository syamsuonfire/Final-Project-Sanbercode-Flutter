import 'package:finalproject_moviegames/app/modules/games_tab/views/games_tab_view.dart';
import 'package:finalproject_moviegames/app/modules/movies_tab/views/movies_tab_view.dart';
import 'package:finalproject_moviegames/app/modules/profile_tab/views/profile_tab_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Obx(() => Icon(
                    Icons.movie_sharp,
                    color: controller.currentIndex.value == 0
                        ? (Colors.blue)
                        : const Color(0xFF6E7FAA),
                    size: 36.0,
                  )),
              onPressed: () => controller.changeTab(0),
            ),
            IconButton(
              icon: Obx(() => Icon(
                    Icons.games_sharp,
                    color: controller.currentIndex.value == 1
                        ? (Colors.blue)
                        : const Color(0xFF6E7FAA),
                    size: 36.0,
                  )),
              onPressed: () => controller.changeTab(1),
            ),
            IconButton(
              icon: Obx(() => Icon(
                    Icons.people,
                    color: controller.currentIndex.value == 2
                        ? (Colors.blue)
                        : const Color(0xFF6E7FAA),
                    size: 36.0,
                  )),
              onPressed: () => controller.changeTab(2),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      MoviesTabView(),
      GamesTabView(),
      ProfileTabView(),
    ];
    return Obx(() => IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ));
  }
}
