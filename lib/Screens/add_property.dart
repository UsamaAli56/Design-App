import 'dart:convert';
import 'dart:io';

import 'package:design/Model/user.dart';
import 'package:design/Screens/Information_complete.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({Key key}) : super(key: key);

  @override
  State<AddPropertyPage> createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  int currentStep = 0;
  String _chosenValue = '';

  TextEditingController regController = TextEditingController();
  TextEditingController plotController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController add3Controller = TextEditingController();
  bool dataAdded;

SharedPreferences sharedPreferences;
  //Config config = Config();
  File image;
  bool data = false;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    final imageTemporary = File(image.path);
    this.image = imageTemporary;
  }
@override
  void initState() {
    super.initState();
    initGetSavedData();
  }

  void initGetSavedData() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String,dynamic> jsonData = jsonDecode(sharedPreferences.getString('userData'));
    User user = User.fromJson(jsonData);

    if(jsonData.isNotEmpty){
      regController.value = TextEditingValue(text: user.regController);
      pController.value = TextEditingValue(text: user.pController);
      plotController.value = TextEditingValue(text: user.plotController);
      add1Controller.value = TextEditingValue(text: user.add1Controller);
      add2Controller.value = TextEditingValue(text: user.add2Controller);
      add3Controller.value = TextEditingValue(text: user.add3Controller);
    }

  }
  void saveData(){
    User user = User(regController.text, plotController.text, pController.text, add1Controller.text, add2Controller.text, add3Controller.text,dataAdded);

    String userData = jsonEncode(user);
    print(userData);
    sharedPreferences.setString('userData', userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45, bottom: 2),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            if (currentStep == 0 &&
                    pController.text.isNotEmpty &&
                    plotController.text.isNotEmpty &&
                    regController.text.isNotEmpty ||
                currentStep == 1 &&
                    add1Controller.text.isNotEmpty &&
                    add2Controller.text.isNotEmpty &&
                    add3Controller.text.isNotEmpty || currentStep == 2) {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                saveData();
                data = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformationComplete(),
                  ),
                );

              } else {
                setState(() {
                  currentStep += 1;
                  data = true;
                });
              }
            } else {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Design Wing"),
                  content: const Text("Please Fill All The Fields"),
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
          onStepCancel: () {
            if (currentStep != 0) {
              setState(() {
                currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text('Property'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    controller: regController,
                    decoration: const InputDecoration(
                      labelText: 'Registration Number *',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    controller: plotController,
                    decoration: const InputDecoration(
                      labelText: 'Plot Type *',
                      border: OutlineInputBorder(),
                    ),

                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    controller: pController,
                    decoration: const InputDecoration(
                      labelText: 'Allotment Number',
                      border: OutlineInputBorder(),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text('Address'),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: add1Controller,
                  decoration: const InputDecoration(
                      labelText: 'Address 1', border: OutlineInputBorder()),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: add2Controller,
                  decoration: const InputDecoration(
                      labelText: 'Address 2', border: OutlineInputBorder()),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                  controller: add3Controller,
                  decoration: const InputDecoration(
                      labelText: 'Address 3', border: OutlineInputBorder()),

                ),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text('Documents'),
          content: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'STEP 1:',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Upload Picture Of Allotment Letter',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      FlatButton(
                        onPressed: () => pickImage(),
                        color: Colors.blue,
                        child: const Text(
                          'Upload',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'STEP 2:',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Upload Picture Of Possession Letter',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      FlatButton(
                        onPressed: () => pickImage(),
                        color: Colors.blue,
                        child: const Text(
                          'Upload',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'STEP 3:',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Upload Picture Of Letter ABC',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      FlatButton(
                        onPressed: () => pickImage(),
                        color: Colors.blue,
                        child: const Text(
                          'Upload',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ];
}
