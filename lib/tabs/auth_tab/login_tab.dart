import 'package:custom_project/controllers/authentication_controller/auth_controller.dart';
import 'package:custom_project/widgets/custom_color.dart';
import 'package:custom_project/widgets/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {

  //Global_Key for Validation
  final _formKey = GlobalKey<FormState>();

  //TextController for Validation
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.color_primary,
        body:  Padding(
          padding: const EdgeInsets.only(top: 20.0, right:40.0 , left:40.0 ),
          child:Form(
          key: _formKey,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(
                controller: email_controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                ),
                validator: (value) {
                  RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  } else {
                    if (!regex.hasMatch(value)) {
                    return 'Enter valid password';
                    } else {
                      return null;
                    }
                  }
                },
              ),

              const  SizedBox(
                height: 30.0,
              ),

              TextFormField(
                obscureText: true,
                controller: password_controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value == null || value.isEmpty) {
                    return 'Enter Password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  }
                },
              ),

              const  SizedBox(
                height: 20.0,
              ),

              //forgot text
              Text('Forgot Password?' , style: CustomTextStyle.forgot_auth),


              //Button Login
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 0.0),
                  child:InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        //send data to the Firebase with Getx
                        //
                        AuthController.controller.Login(email_controller.text.trim() , password_controller.text.trim());
                        //
                        Get.snackbar('Congragulation', 'Successfully Login', backgroundColor: Colors.deepOrange);
                      }else{
                        Get.snackbar('Something went wrong', 'put Your Field correctly', backgroundColor: Colors.red);

                      }
                    },
                    child: Container(
                        width: double.infinity,
                        height: 55.0,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child:Center(
                          child:Text('Login' , style: CustomTextStyle.txt_btn_detail,),
                        )),
                  ))
            ],
          ),
        )
    ));
  }
}
