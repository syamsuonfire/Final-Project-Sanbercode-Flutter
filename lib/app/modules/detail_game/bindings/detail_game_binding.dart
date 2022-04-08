import 'package:get/get.dart';

import '../controllers/detail_game_controller.dart';

class DetailGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailGameController());
  }
}
