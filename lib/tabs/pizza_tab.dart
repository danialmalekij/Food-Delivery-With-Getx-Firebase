import 'package:custom_project/controllers/tabbar_controller/pizza_controller.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PizzaTab extends StatelessWidget {

  PizzaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.list_pizza.length,
        itemBuilder: (context, index) {
           return InkWell(
               onTap: () => Get.toNamed('/detail', parameters: {
             'title' : controller.list_pizza[index].name!,
             'image' : controller.list_pizza[index].image!,
             'price' : controller.list_pizza[index].price!,
           }),
          child:Card(
             child: Column(
               children: [
                 ClipRRect(
                 borderRadius:BorderRadius.circular(10.0),
                 child:Image.network(controller.list_pizza[index].image! , fit: BoxFit.cover, width: 200.0, height: 200.0,)),
                 const SizedBox(height: 8.0,),
                 Text(controller.list_pizza[index].name!,style: CustomTextStyle.text_card_item),
                 const SizedBox(height: 8.0,),
                 Text('\$'+controller.list_pizza[index].price!,style: CustomTextStyle.text_price),
               ],
             ),
           ));
      }),
    );
  }
}
