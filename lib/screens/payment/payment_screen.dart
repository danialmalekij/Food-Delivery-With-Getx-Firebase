import 'package:custom_project/screens/payment/new_payment_screen.dart';
import 'package:custom_project/widgets/custom_color.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}


class _PaymentScreenState extends State<PaymentScreen> {

  int _group_value_payment = 0;
  int _group_value_delivery = 0;

  bool _value = false;
  bool _value1 = false;

  var  bank_title = ['MasterCard' , 'Visa'] ;
  var  card_title = ['Paypal' , 'stripe'] ;

  void method1(int value){
    setState(() {
      _group_value_payment = value;
      _value = true;
    });
  }

  void method2(int value){
    setState(() {
      _group_value_delivery = value;
      _value1 = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.color_primary,

      appBar: AppBar(
        title: const Text('Checkout' , style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios , color: Colors.black,)),
        backgroundColor: CustomColor.color_primary,
        elevation: 0.0,
      ) ,

      body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 40.0 , left: 25.0 , right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding( padding: EdgeInsets.only(left: 15.0),
          child:Text('Payment' , style: CustomTextStyle.payment_title,)),
              SizedBox(height: 40.0,),
            Padding( padding: EdgeInsets.only(left: 15.0),
            child:Text('Payment Type' , style: CustomTextStyle.payment_sub_title,)),
              SizedBox(height: 15.0,),
              Container(
                width: double.infinity,
                height: 130.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  children: [

                    RadioListTile(
                      title: Row(
                          children: [

                            Container(

                                width: 30.0, height:30.0 ,
                                decoration: BoxDecoration(
                                  color: CustomColor.custom_orange,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(Icons.credit_card , color: Colors.white,)
                            ),

                            SizedBox(width: 10.0,),

                            Text('Card' , style: CustomTextStyle.payment_card_title,)

                          ]),
                      activeColor: CustomColor.custom_orange,
                      selected:  _value ,
                      value: 1,
                      groupValue: _group_value_payment,
                      onChanged: (int? value) {
                        method1(value!);
                      },
                    ),

                    Divider(height: 2 , color: Colors.black38,endIndent: 40.0 , indent: 30.0),

                    RadioListTile(
                      title: Row(
                          children: [

                            Container(
                                width: 30.0, height:30.0 ,
                                decoration: BoxDecoration(
                                  color: CustomColor.card_item,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(Icons.account_balance_outlined , color: Colors.white,)
                            ),

                            SizedBox(width: 10.0,),

                            Text('Bank Account' , style: CustomTextStyle.payment_card_title,)

                          ]),
                      activeColor: CustomColor.custom_orange,
                      value: 2,
                      groupValue: _group_value_payment,
                      selected:  _value1 ,
                      onChanged: (int? value) {
                        method1(value!);
                      },
                    ),
                  ],
                )
              ),

              SizedBox(height: 40.0,),
              Padding( padding: EdgeInsets.only(left: 20.0),
              child:Text('Payment Method' , style: CustomTextStyle.payment_sub_title,)),
              SizedBox(height: 15.0,),
              Container(
                  width: double.infinity,
                  height: 130.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Column(
                    children: [

                      RadioListTile(
                        title: Row(
                            children: [

                         SvgPicture.asset(_group_value_payment == 1 ? 'assets/images/paypal.svg' : 'assets/images/mastercard.svg',),


                         SizedBox(width: 10.0,),

                        Text( _group_value_payment == 1 ? card_title[0] : bank_title[0] ,
                          style: CustomTextStyle.payment_card_title,)]),
                        activeColor: CustomColor.custom_orange,
                        value: 1,
                        groupValue: _group_value_delivery,
                        onChanged: (int? value) {
                          method2(value!);
                        },
                      ),

                      Divider(height: 2 , color: Colors.black38,endIndent: 40.0 , indent: 30.0),

                      RadioListTile(
                        title: Row(
                      children: [

                      SvgPicture.asset( _group_value_payment == 1 ? 'assets/images/stripe.svg' : 'assets/images/visa.svg',),


                      SizedBox(width: 10.0,),


                      Text( _group_value_payment == 1 ? card_title[1] : bank_title[1] , style: CustomTextStyle.payment_card_title,)]),
                        activeColor: CustomColor.custom_orange,
                        value: 2,
                        groupValue: _group_value_delivery,
                        onChanged: (int? value) {
                          method2(value!);
                        },
                      ),
                    ],
                  )
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
                  child:InkWell(
                    onTap: ()=> Get.to(NewPaymentScreen()) ,
                    child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child:Center(
                          child:Text('Create New Payment' , style: CustomTextStyle.txt_btn_detail,),
                        )),
                  ))
            ],
          ),),
      ),
    ));
  }
}
