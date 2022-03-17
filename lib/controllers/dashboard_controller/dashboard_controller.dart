import 'package:get/get.dart';

class DashboardController extends GetxController{

  int tab_index = 0;

  void changeTabIndex(int index) {
    tab_index = index;
    update();
  }
}