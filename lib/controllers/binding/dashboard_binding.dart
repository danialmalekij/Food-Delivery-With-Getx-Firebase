import 'package:custom_project/controllers/dashboard_controller/account_controller.dart';
import 'package:custom_project/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:custom_project/controllers/dashboard_controller/fav_controller.dart';
import 'package:custom_project/controllers/dashboard_controller/history_controller.dart';
import 'package:custom_project/controllers/dashboard_controller/home_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavController>(() => FavController());
    Get.lazyPut<HistoryController>(() =>HistoryController());
    Get.lazyPut<AccountController>(() => AccountController());
  }

}

