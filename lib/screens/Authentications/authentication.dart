import 'package:custom_project/tabs/auth_tab/login_tab.dart';
import 'package:custom_project/tabs/auth_tab/sign_up.dart';
import 'package:custom_project/widgets/custom_color.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> with TickerProviderStateMixin {

  late TabController tab_controller;

  @override
  void initState() {
    super.initState();
    tab_controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tab_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.color_primary,
      body: SafeArea(

        child: SingleChildScrollView(
        child:Column(
            children: [

          //Top white  Container
          Container(
        decoration: const BoxDecoration(
      color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          )
      ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.31,
        child: Column(
          children: [

        //image
        Padding(padding: EdgeInsets.only(top: 20.0),
                child:Image.asset('assets/images/logo_app.jpg', width: 150.0, height: 160,)),


      //tab_bar
      Padding(padding: EdgeInsets.only(top: 10.0 , right: 40.0 , left: 40.0),
        child:Container(
              child: TabBar(
                  controller: tab_controller,
                  labelStyle: CustomTextStyle.title_auth_tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: CustomColor.custom_orange,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  tabs: const [
                    Tab(text: 'Login' ,),
                    Tab(text: 'Sign-Up'),
                  ]),
        )),
          ],
        ),
      ),


          //TabView
          Container(
            margin: const EdgeInsets.only(top: 30.0 , right: 10.0),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.6,
            child: TabBarView(
                controller: tab_controller,
                children : const[
                  LoginTab(),
                  SignUpTab(),
                ]),
          ),
        ],
      ))));
  }
}
