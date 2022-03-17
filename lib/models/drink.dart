import 'package:cloud_firestore/cloud_firestore.dart';

class Drink{
  String? id;
  String? name ;
  String? image ;
  String? price;

  Drink({this.name , this.image , this.price});

  Drink.fromMap(DocumentSnapshot data){
  id = data.id;
  name = data['name'];
  image = data['image'];
  price = data['price'];

  }
}