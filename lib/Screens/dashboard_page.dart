import 'dart:convert';

import 'package:design/Model/user.dart';
import 'package:design/Screens/Property_screen.dart';
import 'package:design/Screens/profile_screen.dart';
import 'package:design/Screens/service_page.dart';
import 'package:design/Screens/services_selection.dart';
import 'package:design/components/background.dart';
import 'package:design/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ongoing_services.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isChecked = false;
  //Config config;
  bool visibility = false;
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    // visibility = config.visibleCategories;
    super.initState();
    initGetSavedData();
  }

  void initGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString('userData'));
    User user = User.fromJson(jsonData);
    print(jsonData);
    if (jsonData.isNotEmpty) {
      setState(() {
        visibility = true;
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
  String regController;
  String pController;
  String plotController;
  String add1Controller;
  String add2Controller;
  String add3Controller;
  bool dataAdded;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 65, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome,',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Test User.',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  height: 130,
                  width: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.blue,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Announcements:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Please Select Services To Proceed.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Notifications:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'There are no Notifications yet.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                children: [
                  // Text(
                  //   'Please Select Options To Proceed:',
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  // ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 15,top: 5),
                  //     child: Text(
                  //       'Your Status:',
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       checkColor: Colors.white,
                  //       //fillColor: Colors.blue,
                  //       value: isChecked,
                  //
                  //       shape: CircleBorder(),
                  //       onChanged: (bool? value) {
                  //         setState(() {
                  //           isChecked = false;
                  //         });
                  //       },
                  //     ),
                  //     const Text('Foreigner.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       checkColor: Colors.white,
                  //       //fillColor: Colors.blue,
                  //       value: isChecked,
                  //       shape: CircleBorder(),
                  //       // onChanged: (bool? value) {
                  //       //   setState(() {
                  //       //     isChecked = value!;
                  //       //   });
                  //       // },
                  //       onChanged: (bool){},
                  //     ),
                  //     const Text('Pakistani.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  //   ],
                  // ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 15,top: 5),
                  //     child: Text(
                  //       'Property Status:',
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       checkColor: Colors.white,
                  //       //fillColor: Colors.blue,
                  //       value: isChecked,
                  //       shape: CircleBorder(),
                  //       onChanged: (bool){},
                  //       // onChanged: (bool? value) {
                  //       //   setState(() {
                  //       //     isChecked = value!;
                  //       //   });
                  //       // },
                  //     ),
                  //     const Text('Resedential.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       checkColor: Colors.white,
                  //       //fillColor: Colors.blue,
                  //       value: isChecked,
                  //       shape: CircleBorder(),
                  //       onChanged: (bool){},
                  //       // onChanged: (bool? value) {
                  //       //   setState(() {
                  //       //     isChecked = value!;
                  //       //   });
                  //       // },
                  //     ),
                  //     const Text('Commercial.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PropertyPage()));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.purpleAccent,
                                    Colors.blue,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.house_outlined,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                    Text(
                                      'Your Property',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              if (visibility) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ServicesSelection()));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Design Wing"),
                                    content:
                                        const Text("Add Your Property First!"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                gradient: visibility
                                    ? LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.purpleAccent,
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          Colors.grey,
                                          Colors.grey,
                                        ],
                                      ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.design_services_outlined,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                    Text(
                                      'Select Services',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              if (visibility) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OngoingServices()));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Design Wing"),
                                    content:
                                        const Text("Add Your Property First!"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                gradient: visibility
                                    ? LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.purpleAccent,
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          Colors.grey,
                                          Colors.grey,
                                        ],
                                      ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.miscellaneous_services_outlined,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                    Text(
                                      'On-Going Services',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              if (visibility) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen()));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Design Wing"),
                                    content:
                                        const Text("Add Your Property First!"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                gradient: visibility
                                    ? LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.purpleAccent,
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          Colors.grey,
                                          Colors.grey,
                                        ],
                                      ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                    Text(
                                      'Profile',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(right: 15,top: 30),
                  //   child: Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: FlatButton(
                  //       height: 50,
                  //       shape: StadiumBorder(),
                  //       color: Colors.blueAccent,
                  //       onPressed: (){
                  //         Navigator.push(context, MaterialPageRoute(builder: (context)=> ServicePage()));
                  //       },
                  //       child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 30,),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
