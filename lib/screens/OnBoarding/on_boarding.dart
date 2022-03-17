import 'package:custom_project/screens/HomeScreen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Nearby restaurants',
            body: 'You don\'t have to go far to find a good restaurant\nwe have provided all the restaurants that is\nnear you',
            image: buildImage('assets/images/track_map.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Select the Favorites Menu',
            body: 'Now eat well, don\'t leave the house,You can\nchoose your favorite food only with\none click',
            image: buildImage('assets/images/order.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Good food at a cheap price',

            body: 'You can eat at expensive restaurants with\naffordable price',
            image: buildImage('assets/images/safe_food.jpg'),
            decoration: getPageDecoration(),
          ),
        ],
        done: const Text('Read', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        onDone: () => Get.offAllNamed('/home'),
        showSkipButton: true,
        skip: const Text('Skip'),
        onSkip: () => Get.offAllNamed('/auth'),
        next: const Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Colors.white,
        nextFlex: 0,
        // isProgressTap: false,
        // isProgress: false,
        // showNextButton: false,
        // freeze: true,
        // animationDuration: 1000,
      ),
    );}

    Widget buildImage(String path) => Center(child: Image.asset(path, width: 300 , height: 300,));

    DotsDecorator getDotDecoration() => DotsDecorator(
      color: Color(0xFFBDBDBD),
      //activeColor: Colors.orange,
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

    PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 24 , fontWeight: FontWeight.w600 )),
      bodyTextStyle: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 12 , fontWeight: FontWeight.w400 )),
      imagePadding: const EdgeInsets.fromLTRB(32.0 , 32.0 , 32.0 , 32.0),
      pageColor: Colors.white,
    );

}
