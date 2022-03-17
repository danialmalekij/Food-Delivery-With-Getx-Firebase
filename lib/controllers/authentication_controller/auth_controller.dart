import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_project/controllers/binding/dashboard_binding.dart';
import 'package:custom_project/screens/Dashboard/dashboard_page.dart';
import 'package:custom_project/widgets/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthController extends GetxController{

  //create instance of this controller to access this every place
  static final AuthController controller = Get.find();
  //include user information(name , email , password ,...)
  late Rx<User?> _user;
  //crete instance of firebaseAuth to access for property of authentication in firebase
  FirebaseAuth auth = FirebaseAuth.instance;

  final box = GetStorage();





  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(auth.currentUser); //give status user to _user
    _user.bindStream(auth.userChanges()); //our user would be notified
    ever( _user , _initialScreen ); //this method is from getx that have listener(check user status[login/logout..] after that function initialscreen notified)
  }


  // TODO: check user login or didn't log in
  _initialScreen(User? user){
    if(user == null){
      print('Log In');
      Get.offAndToNamed('/auth');
    }else{
      print('Welcome to the Home Screen');
      //Get.offAll(()=> HomePage(email: user.email));
      Get.offAll(()=> DashboardPage() , binding: DashboardBinding());
      //save email in get_storage
      box.write('email' , user.email);
    }
  }


  //crete function for register
  void register(String email , String password) async{
    try{
     await  auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar('Some thing went wrong', e.toString());
    }
  }

  //crete function for Login
  void Login(String email , String password) async{
    try{
     await  auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar('User not found' , e.toString());
    }
  }

  //crete function for Log out
  void LogOut() async{
   await auth.signOut();
  }


  //crete function for Adding another data user register
  void data(String username,  String email){

    var user_auth_status = FirebaseAuth.instance.currentUser;

    var user_firestore_coll = FirebaseFirestore.instance;

    user_firestore_coll.collection('users').add(
      {
         'username' : username ,
         'email' : email
      }
    );

  }

  Future<void> getUserName(){
    return firebase_firestore.collection('users').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) => result.data()["username"]);
    });
  }


}