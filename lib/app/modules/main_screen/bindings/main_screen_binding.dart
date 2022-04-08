import 'package:finalproject_moviegames/app/modules/games_tab/controllers/games_tab_controller.dart';
import 'package:finalproject_moviegames/app/modules/movies_tab/controllers/movies_tab_controller.dart';
import 'package:finalproject_moviegames/app/modules/profile_tab/controllers/profile_tab_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
    Get.put(MoviesTabController());
    Get.put(GamesTabController());
    Get.put(ProfileTabController());
  }
}
