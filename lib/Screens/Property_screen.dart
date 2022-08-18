import 'dart:convert';

import 'package:design/Model/user.dart';
import 'package:design/Screens/add_property.dart';
import 'package:design/components/background.dart';
import 'package:design/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({Key key}) : super(key: key);

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  //Config config = Config();
  String regController;
  String plotController ;
  String pController ;
  String add1Controller ;
  String add2Controller;
  String add3Controller;
  bool dataAdded;
  bool data = false;


  @override
  void initState() {
   // regControllerT = config.regController.toString();
    //data = config.dataAdded;
    super.initState();
    initGetSavedData();
  }
  SharedPreferences sharedPreferences;

  void initGetSavedData() async{
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String,dynamic> jsonData = jsonDecode(sharedPreferences.getString('userData'));
    User user = User.fromJson(jsonData);
    print(jsonData);
    if(jsonData.isNotEmpty){
      setState(() {
        data = true;
      });
      regController = user.regController;
      pController = user.pController;
      plotController = user.plotController;
      add1Controller=  user.add1Controller;
      add2Controller = user.add2Controller;
      add3Controller = user.add3Controller;
      dataAdded = user.dataAdded;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 65, left: 10, bottom: 5),
                child: Text(
                  'Add Property:',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPropertyPage()));
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.purpleAccent,
                          Colors.blue,
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: .1,
                          spreadRadius: .2,
                          offset: Offset(.1, .5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 5),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.add_circle_outline,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Add Property',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 10, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Properties.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            data ?
            Padding(
              padding: EdgeInsets.only(left: 15, right: 10, bottom: 10, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                // Text(
                //    'No Properties, Please Add Property First.',
                //    style: TextStyle(
                //        fontSize: 16, fontWeight: FontWeight.w500),
                //  )
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purpleAccent,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 8,top: 10),
                        child: Row(
                          children: [
                            Text('Registeration Number:',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                            SizedBox(width: 5,),
                            Text(regController != null ? regController: '',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 8,top: 8),
                        child: Row(
                          children: [
                            Text('Allotment Number:',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                            SizedBox(width: 5,),
                            Text(regController != null ? pController: '',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 10,right: 8,top: 8),
                        child: Row(
                          children: [
                            Text('Plot Type:',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                            SizedBox(width: 5,),
                            Text(regController != null ? plotController: '',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 10,right: 8,top: 8),
                        child: Row(
                          children: [
                            Text('Address:',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                            SizedBox(width: 5,),
                            Text(regController != null ? add1Controller: '',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            :

            Text('Please Add The Properties First',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
