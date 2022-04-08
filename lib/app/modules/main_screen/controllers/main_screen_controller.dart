import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
