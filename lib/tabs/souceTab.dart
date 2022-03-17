import 'package:custom_project/controllers/tabbar_controller/souce_controller.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SouceTab extends StatelessWidget {

  SouceController controller  = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> ListView.builder(
        itemCount: controller.list_souce.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return InkWell(
            onTap: () => Get.toNamed('/detail', parameters: {
          'title' : controller.list_souce[index].name!,
          'image' : controller.list_souce[index].image!,
          'price' : controller.list_souce[index].price!,
        }),
          child:Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(controller.list_souce[index].image! , width: 200.0, height: 200.0, fit: BoxFit.cover,),
              ),
              SizedBox(height: 8.0),
              Text(controller.list_souce[index].name! , style: CustomTextStyle.text_card_item),
              SizedBox(height: 8.0),
              Text('\$'+controller.list_souce[index].price! , style: CustomTextStyle.text_price),
            ],
          ),
        ));
      }),
    );
  }
}
