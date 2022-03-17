import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_project/models/food.dart';
import 'package:get/get.dart';

class FoodController extends GetxController{

  static FoodController controller = Get.find();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<Food> my_food_list = RxList<Food>([]); //observable(using RX)
  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    collectionReference  = firestore.collection('foods');
    my_food_list.bindStream(getAllFoods());
  }

  @override
  void onReady() {
    super.onReady();
  }

  Stream<List<Food>> getAllFoods() =>
        collectionReference.snapshots().map((query) =>
            query.docs.map((item) => Food.fromMap(item)).toList());

}