import 'package:custom_project/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:custom_project/screens/HomeScreen/account_screen.dart';
import 'package:custom_project/screens/HomeScreen/favorit_screen.dart';
import 'package:custom_project/screens/HomeScreen/history_screen.dart';
import 'package:custom_project/screens/HomeScreen/home_page.dart';
import 'package:custom_project/widgets/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
          builder: (controller){
          return Scaffold(
            body:  SafeArea(
                child: IndexedStack(
                  index: controller.tab_index,
                  children: [
                    HomePage(),
                    FavoriteScreen(),
                    HistoryScreen(),
                    AccountScreen()
                  ],
                )),
              bottomNavigationBar: BottomNavigationBar(
              backgroundColor: CustomColor.color_primary,
              unselectedItemColor: CustomColor.unselect_color_bottom_navigation_bar,
              selectedItemColor: CustomColor.custom_orange,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tab_index,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: const[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Favorite'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Account'
                ),]
            ),
          );
     });
  }
}
