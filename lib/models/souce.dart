import 'package:cloud_firestore/cloud_firestore.dart';

class Souce{

  String? id;
  String? name;
  String? image;
  String? price;

  Souce({this.name , this.image , this.price});


  Souce.fromMap(DocumentSnapshot data){
    id = data.id;
    name = data['name'];
    image = data['image'];
    price = data['price'];
  }

}