import 'package:get/state_manager.dart';

class DashboardController extends GetxController{

  var tabIndex = 0;
  changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}