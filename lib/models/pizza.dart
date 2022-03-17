import 'package:cloud_firestore/cloud_firestore.dart';

class Pizza{

  String? id;
  String? name;
  String? image;
  String? price;

  Pizza({this.name , this.image , this.price});


  Pizza.fromMap(DocumentSnapshot data){
    id = data.id;
    name = data['name'];
    image = data['image'];
    price = data['price'];
  }

}