import 'package:custom_project/controllers/tabbar_controller/food_controller.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodTab extends StatelessWidget {

  FoodController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: controller.my_food_list.length ,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Get.toNamed('/detail', parameters: {
              'title' : controller.my_food_list[index].name!,
              'image' : controller.my_food_list[index].image!,
              'price' : controller.my_food_list[index].price!,
            }),
            child:Card(
            child: Column(
                children: [
                Image.network(controller.my_food_list[index].image! , width: 200.0, height: 200.0, fit: BoxFit.cover,),
                Text(controller.my_food_list[index].name! , style: CustomTextStyle.text_card_item),
                const SizedBox(height: 8.0,),
                Text('\$'+controller.my_food_list[index].price! , style: CustomTextStyle.text_price),
                ],
      )));}));
  }
}
