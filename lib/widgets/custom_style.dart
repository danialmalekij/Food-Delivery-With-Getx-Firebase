import 'package:custom_project/widgets/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle main_header = const TextStyle(
    color: Colors.black , fontSize: 34.0 , fontWeight: FontWeight.bold,
    fontFamily: 'sf_pro'
  );
static TextStyle text_card_item = const TextStyle(
    color: Colors.black , fontSize: 22.0 , fontWeight: FontWeight.w600,
    fontFamily: 'sf_pro'
  );

static TextStyle text_price =  TextStyle(
    color: CustomColor.custom_orange , fontSize: 17.0 , fontWeight: FontWeight.bold,
    fontFamily: 'sf_pro'
  );
static TextStyle header_detail = const TextStyle(
    color: Colors.black , fontSize: 17.0 , fontWeight: FontWeight.w600,
    fontFamily: 'sf_pro'
  );
static TextStyle subtitle_detail = const TextStyle(
    color: Colors.black38 , fontSize: 15.0 , fontWeight: FontWeight.w400,
    fontFamily: 'sf_pro'
  );
static TextStyle subtitle_profile = TextStyle(
    color: CustomColor.custom_orange , fontSize: 15.0 , fontWeight: FontWeight.w400,
    fontFamily: 'sf_pro'
  );
static TextStyle txt_btn_detail = const TextStyle(
    color: Colors.white , fontSize: 17.0 , fontWeight: FontWeight.w600,
    fontFamily: 'sf_pro'
  );

static TextStyle title_auth_tab = const TextStyle(
    color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.w600,
    fontFamily: 'sf_pro'
  );

static TextStyle forgot_auth = const TextStyle(
    color: Colors.deepOrange , fontSize: 16.0 , fontWeight: FontWeight.w600,
    fontFamily: 'sf_pro'
  );

static TextStyle payment_title = const TextStyle(
    color: Colors.black , fontSize: 34.0 , fontWeight: FontWeight.w600,
    fontFamily: 'sf_pro'
  );

static TextStyle payment_sub_title = const TextStyle(
    color: Colors.black , fontSize: 17.0 , fontWeight: FontWeight.w600,
    fontFamily: 'sf_pro'
  );


static TextStyle payment_card_title = const TextStyle(
    color: Colors.black , fontSize: 17.0 , fontWeight: FontWeight.w400,
    fontFamily: 'sf_pro'
  );



}