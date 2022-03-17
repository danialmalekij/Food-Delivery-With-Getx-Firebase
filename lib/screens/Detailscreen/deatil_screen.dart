import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailScreen extends StatelessWidget {

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:InkWell(
          onTap: ()=> Get.back(),
            child: const Icon(
          Icons.arrow_back_ios ,
          color: Colors.black,
          size: 20,)),
        actions: const[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.favorite_border , color: Colors.black,size: 20,))],

       ),
      body: Column(
        children: [

          //image
          Row(
      mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(padding: EdgeInsets.only(top: 15.0),
          child: Image.network(Get.parameters['image']! , width: 240.0, height: 240.0,),
          ),]
          ),

          //title
          Text( Get.parameters['title']! , style: CustomTextStyle.text_card_item),
          const SizedBox(height: 8.0,),
          Text('\$'+Get.parameters['price']! , style: CustomTextStyle.text_price),

          const SizedBox(
          height: 50.0,),

          //title_detail
          Padding(padding: EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery Data' , style: CustomTextStyle.header_detail),
            const SizedBox(
              height: 10.0,),
            Text('Delivered between monday aug and\n thursday 20 from 8pm to 91:32 pm' , style: CustomTextStyle.subtitle_detail),

            const SizedBox(
              height: 40.0,),


            Text('Return policy',style: CustomTextStyle.header_detail),
            const SizedBox(
              height: 10.0,),
            Text('All our foods are double checked before\n leaving our stores so by any case you\n found a broken food please contact our\n hotline immediately.',style: CustomTextStyle.subtitle_detail),

          ]
        )),

         Padding(
          padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0.0),
            child:InkWell(
            onTap: (){},
              child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(30.0)
              ),
              child:Center(
              child:Text('Add to Cart' , style: CustomTextStyle.txt_btn_detail,),
            )),
          ))
        ]),
    );
  }
}
