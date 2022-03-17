import 'package:custom_project/controllers/authentication_controller/auth_controller.dart';
import 'package:custom_project/tabs/drink_tab.dart';
import 'package:custom_project/tabs/food_tab.dart';
import 'package:custom_project/tabs/pizza_tab.dart';
import 'package:custom_project/tabs/souceTab.dart';
import 'package:custom_project/widgets/custom_color.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late TabController tab_controller;
  final box = GetStorage();


  @override
  void initState() {
    super.initState();
    tab_controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tab_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var email = box.read('email');
    return Scaffold(
      backgroundColor: CustomColor.color_primary,
      appBar: AppBar(
        backgroundColor: CustomColor.color_primary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 20.0),
        child: Builder(builder: (scaffoldContext)=>
          InkWell(
            onTap: () => Scaffold.of(scaffoldContext).openDrawer(),
              child: Icon(Icons.menu , color: Colors.black38,))),
          ), actions: const [
          Padding(
          padding: EdgeInsets.only(right: 20.0),
          child:Icon(Icons.shopping_cart , color: Colors.black26,))
          ],),


          drawer:Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
          DrawerHeader(
          decoration: const BoxDecoration(
          color: Colors.deepOrange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo_app.jpg'),
                    radius: 40.0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text( email , style: TextStyle(color: Colors.white),),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('phone :  '+'+1 254678',style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person_outline),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text('Orders'),
              leading: const Icon(Icons.add_shopping_cart),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text('Offer and promo'),
              leading: const  Icon(Icons.local_offer_outlined),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text('Privacy policy'),
              leading: const Icon(Icons.sticky_note_2_outlined),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text('Account'),
              leading: const Icon(Icons.payment),
              onTap: () {
                Get.toNamed('/payment');
              },
            ),
            const SizedBox(height: 200),
            Padding( padding: EdgeInsets.only(left: 25.0),
            child: InkWell(
              onTap: (){
                AuthController.controller.LogOut();
                Get.toNamed('/auth');
              },
            child:Row(
              children: const[
              Text('Sign Out'),
              SizedBox(width: 10.0,),
              Icon(Icons.arrow_forward_rounded),],
            )))
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 43.0 , left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delicious\nfood for you' , style: CustomTextStyle.main_header,),
            const SizedBox(
              height: 28.0,
            ),
            Padding(padding: const EdgeInsets.only(right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'search',
                  prefixIcon: const Icon(Icons.search_rounded, color: Colors.black,),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              child: TabBar(
                controller: tab_controller,
                  labelColor: CustomColor.custom_orange,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: CustomColor.custom_orange,
                  tabs: const [
                    Tab(text: 'Foods'),
                    Tab(text: 'Pizzas'),
                    Tab(text: 'Drinks'),
                    Tab(text: 'Souce'),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18.0 , right: 10.0),
              width: double.maxFinite,
              height: 280.0,
              child: TabBarView(
                controller: tab_controller,
                  children : [
                    FoodTab(),
                    PizzaTab(),
                    DrinkTab(),
                    SouceTab()
                  ]),
            ),
          ],
        )
      ),
    );
  }
}
