



import 'dart:io';

import 'package:design/Model/customer_model.dart';
import 'package:design/Screens/login/login.dart';
import 'package:design/Screens/register/verify_email.dart';

import 'package:design/components/background.dart';
import 'package:design/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthenticationServices authenticationServices;
  CustomerModel model;
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController cnicController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey formKey = GlobalKey();
  bool validate = false;
  File image;

  Future pickImage() async{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
   if(image == null) return null;

   final imageTemporary = File(image.path);
   setState(() {
     this.image = imageTemporary;
   });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Mobile Number"),
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: cnicController,
                      decoration: InputDecoration(labelText: "CNIC Number"),
                      onChanged: (value){
                        value = cnicController.text;
                        //cnicController.text = value;
                        model.cnic = cnicController.text;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: FlatButton(
                          onPressed: () => pickImage(),
                          color: Colors.grey[300],
                          child: Text('Upload')),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Gender',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Radio(value: 0, groupValue: 1, onChanged: (value) {}),
                        Text('Male',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                        Text('Female',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  child: TextField(
                    key: formKey,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText: validate ? 'Value Can\'t Be Empty' : null,
                    ),
                    onChanged: (value){
                      value =  emailController.text;
                      //emailController.text = value;
                      model.email = emailController.text;
                    },
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  onChanged: (value){
                    value = passwordController.text;
                    //passwordController.text = value;
                    model.password = passwordController.text;
                  },
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      emailController.text.isEmpty
                          ? validate = true
                          : validate = false;
                    });
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Verify Your Account Through!?"),
                        content: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 70,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'Phone Verification Through OTP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    authenticationServices.createCustomer(model);
                                    //SignUp();
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyEmail()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: 30,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      'Email Verification',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Dismiss"),
                          ),
                        ],
                      ),
                    );
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyDocuments()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41)
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "SIGN UP",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Already Have an Account? Sign in",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future SignUp() async {
  //   //final isValid = formKey.currentState.validate();
  //   if (validate) return;
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyEmail()));
  //
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     SnackBar(
  //       content: Text(e.message.toString()),
  //     );
  //   }
  // }
}
