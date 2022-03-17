import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_project/models/pizza.dart';
import 'package:get/get.dart';

class PizzaController extends GetxController{

  static PizzaController controller = Get.find();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<Pizza> list_pizza = RxList<Pizza>([]);
  late CollectionReference collectionReference;
  
  @override
  void onInit() {
    super.onInit();
  collectionReference = firestore.collection('pizzas');
  list_pizza.bindStream(getAllPizza());
  }

  @override
  void onReady() {
    super.onReady();
  }


  Stream<List<Pizza>> getAllPizza() =>
    collectionReference.snapshots().map((query) =>
    query.docs.map((item) => Pizza.fromMap(item)).toList());







}