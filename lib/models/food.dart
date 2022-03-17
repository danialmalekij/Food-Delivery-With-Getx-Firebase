import 'package:cloud_firestore/cloud_firestore.dart';

class Food{

  String? id;
  String? name ;
  String? image ;
  String? price;

  Food({this.name , this.image , this.price});

  Food.fromMap(DocumentSnapshot data){
    id = data.id;
    name = data['name'];
    image = data['image'];
    price = data['price'];
  }

}