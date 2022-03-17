import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_project/models/pizza.dart';
import 'package:custom_project/models/souce.dart';
import 'package:get/get.dart';

class SouceController extends GetxController{

  static SouceController controller = Get.find();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<Souce> list_souce = RxList<Souce>([]);
  late CollectionReference collectionReference;
  
  @override
  void onInit() {
    super.onInit();
  collectionReference = firestore.collection('souces');
  list_souce.bindStream(getAllSouce());
  }

  @override
  void onReady() {
    super.onReady();
  }


  Stream<List<Souce>> getAllSouce() =>
    collectionReference.snapshots().map((query) =>
    query.docs.map((item) => Souce.fromMap(item)).toList());







}