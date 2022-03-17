import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_project/models/drink.dart';
import 'package:get/get.dart';

class DrinkController extends GetxController{

  static DrinkController controller = Get.find();

  RxList<Drink> list_drink = RxList<Drink>([]);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;


  @override
  void onInit() {
    super.onInit();
    collectionReference = firestore.collection('drinks');
    list_drink.bindStream(getAllDrinks());
  }


  @override
  void onReady() {
    super.onReady();
  }

  Stream<List<Drink>> getAllDrinks() =>
    collectionReference.snapshots().map((query) =>
    query.docs.map((item) => Drink.fromMap(item)).toList());

}