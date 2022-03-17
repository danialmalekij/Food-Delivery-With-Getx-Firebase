import 'package:custom_project/controllers/authentication_controller/auth_controller.dart';
import 'package:custom_project/controllers/binding/dashboard_binding.dart';
import 'package:custom_project/controllers/tabbar_controller/drink_controller.dart';
import 'package:custom_project/controllers/tabbar_controller/food_controller.dart';
import 'package:custom_project/controllers/tabbar_controller/pizza_controller.dart';
import 'package:custom_project/controllers/tabbar_controller/souce_controller.dart';
import 'package:custom_project/screens/Authentications/authentication.dart';
import 'package:custom_project/screens/Dashboard/dashboard_page.dart';
import 'package:custom_project/screens/Detailscreen/deatil_screen.dart';
import 'package:custom_project/screens/HomeScreen/account_screen.dart';
import 'package:custom_project/screens/HomeScreen/favorit_screen.dart';
import 'package:custom_project/screens/HomeScreen/history_screen.dart';
import 'package:custom_project/screens/HomeScreen/home_page.dart';
import 'package:custom_project/screens/payment/payment_screen.dart';
import 'package:custom_project/screens/OnBoarding/on_boarding.dart';
import 'package:custom_project/widgets/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AuthController()); //bind our auth controller
    Get.put(FoodController());
    Get.put(PizzaController());
    Get.put(DrinkController());
    Get.put(SouceController());
  });
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom App',
      theme: ThemeData(primarySwatch: Colors.blue,),
      getPages: [
        GetPage(name: '/', page: () => DashboardPage() , binding: DashboardBinding()),
        GetPage(name: '/on_boarding', page: () => OnBoarding()),
        GetPage(name: '/auth', page: () => Authentication()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/favorite', page: () => FavoriteScreen()),
        GetPage(name: '/history', page: () => HistoryScreen()),
        GetPage(name: '/account', page: () => AccountScreen()),
        GetPage(name: '/detail', page: ()=> DetailScreen()),
        GetPage(name: '/payment', page: ()=> PaymentScreen())
      ],
    );
  }
}
