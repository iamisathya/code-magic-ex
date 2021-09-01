import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _currentTabIndex = 0.obs;

  int get onTabTapped => _currentTabIndex.value;

  set onTabTapped(int value) {
    _currentTabIndex.value = value;
  }
}
