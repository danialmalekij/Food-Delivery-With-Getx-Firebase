import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_project/controllers/authentication_controller/auth_controller.dart';
import 'package:custom_project/screens/HomeScreen/history_screen.dart';
import 'package:custom_project/widgets/custom_color.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  // TODO:There is Problem to Upload Image In Profile
  //TODO: The Best Way for Solve it , show a video to upload image in firebase

  File? _image;
  final ImagePicker _picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _retrievedImageUrl;


  Future getImage() async {

    var image = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image as File?;
      });

  }

  Future uploadImage() async {
      Reference reference = await FirebaseStorage.instance.ref().child(_image!.path);

      final UploadTask uploadTask = reference.putFile(_image!);

      TaskSnapshot taskSnapshot= await uploadTask.whenComplete(() => 
      print('Successfully Image Uploaded'));
  /*
      String imageUrl = await reference.getDownloadURL();
      await _firestore.collection("users").doc(AuthController.controller.auth.currentUser!.uid).set({
        "profilePicture": imageUrl,
      });
   */
  }

  Future retrieveImage() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await _firestore.collection("users").doc(AuthController.controller.auth.currentUser!.uid).get();
      setState(() {
        //_retrievedImageUrl = documentSnapshot.data["profilePicture"];
        _retrievedImageUrl = documentSnapshot.get(['profilePicture']);
      });
    } catch (e) {
      print(e);
    }
  }

  String MySplite(String userEmail){
    return userEmail.substring(0,6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.color_primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.only(top: 40.0 , left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Profile' , style: CustomTextStyle.payment_title,),
                const SizedBox(height: 40.0,),
                Padding(padding:EdgeInsets.only(right: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Personal details' , style: CustomTextStyle.title_auth_tab,),
                      InkWell(
                        onTap: (){
                          getImage();
                        },
                        child: Column(
                          children: [
                            Text('Change' , style: CustomTextStyle.subtitle_profile,),
                            SizedBox(height: 10,),
                            Visibility(
                              child: InkWell(
                                onTap: (){
                                  uploadImage();
                                },
                                child: Text('Upload' , style: CustomTextStyle.subtitle_profile,)),
                              visible: true,
                            ),
                            ],
                        )
                      )
                    ],
                  ),),
                const SizedBox(height: 20.0,),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20.0),
                  width: double.infinity,
                  height: 200.0,
                  decoration:  BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: (_retrievedImageUrl != null)
                            ? Image.network(_retrievedImageUrl! , width: 90.0, height: 100.0,alignment: Alignment.topLeft,)
                            : Image.asset('assets/images/google.png', width: 90.0, height: 100.0,alignment: Alignment.topLeft,),
                        height: 300,
                      ),
                      const SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(MySplite(AuthController.controller.auth.currentUser!.email!), style: CustomTextStyle.title_auth_tab,),
                          const SizedBox(height: 10.0,),
                          Text(AuthController.controller.auth.currentUser!.email! , style: CustomTextStyle.subtitle_detail,),
                          const SizedBox(height: 10.0,),
                          //const Divider(height: 1,thickness: 1, indent: 20.0, endIndent: 20.0,color: Colors.black,),                        SizedBox(height: 10.0,),
                          Text('+234 9011039271' , style: CustomTextStyle.subtitle_detail,),
                          const SizedBox(height: 10.0,),
                          Text('No 15 uti street off ovie\n palace road effurun delta\n state' , style: CustomTextStyle.subtitle_detail,),

                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10.0,),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 0.0),
                    child:InkWell(
                      onTap: ()=> Get.to(HistoryScreen()) ,
                      child: Container(
                          width: double.infinity,
                          height: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child:ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                            title:Text('Orders' , style:CustomTextStyle.title_auth_tab),
                            trailing: Icon(Icons.arrow_forward_ios , color: Colors.black,),
                          )),
                    )),

                const SizedBox(height: 10.0,),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 0.0),
                    child:InkWell(
                      onTap: ()=> Get.to(HistoryScreen()) ,
                      child: Container(
                          width: double.infinity,
                          height: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child:ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                            title:Text('Pending reviews' , style:CustomTextStyle.title_auth_tab),
                            trailing: Icon(Icons.arrow_forward_ios , color: Colors.black,),
                          )),
                    )),


                const SizedBox(height: 10.0,),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 0.0),
                    child:InkWell(
                      onTap: ()=> Get.to(HistoryScreen()) ,
                      child: Container(
                          width: double.infinity,
                          height: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child:ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                            title:Text('Faq' , style:CustomTextStyle.title_auth_tab),
                            trailing: Icon(Icons.arrow_forward_ios , color: Colors.black,),
                          )),
                    )),


                const SizedBox(height: 10.0,),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 0.0),
                    child:InkWell(
                      onTap: ()=> Get.to(HistoryScreen()) ,
                      child: Container(
                          width: double.infinity,
                          height: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child:ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                            title:Text('Help' , style:CustomTextStyle.title_auth_tab),
                            trailing: Icon(Icons.arrow_forward_ios , color: Colors.black,),
                          )),
                    )),
              ],
            ),),
        ),
      ),
    );
  }
}
