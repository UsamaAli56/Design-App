import 'package:design/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'services_selection.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    child: SvgPicture.asset("assets/images/bahrialogo.svg",
                        height: 160),
                  ),
                ),
                // Flexible(
                //   child: TextField(
                //     decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.search),
                //       hintText: 'Search For Services',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15),
                //         borderSide: BorderSide.none,
                //       ),
                //       fillColor: Colors.grey[200],
                //       filled: true,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      'Your Status:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      //fillColor: Colors.blue,
                      value: isChecked,

                      shape: CircleBorder(),
                      onChanged: (bool value) {
                        setState(() {
                          isChecked = false;
                        });
                      },
                    ),
                    const Text(
                      'Foreigner.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      //fillColor: Colors.blue,
                      value: isChecked,
                      shape: const CircleBorder(),
                      // onChanged: (bool? value) {
                      //   setState(() {
                      //     isChecked = value!;
                      //   });
                      // },
                      onChanged: (bool) {},
                    ),
                    const Text(
                      'Pakistani.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      'Property Status:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      //fillColor: Colors.blue,
                      value: isChecked,
                      shape: const CircleBorder(),
                      onChanged: (bool) {},
                      // onChanged: (bool? value) {
                      //   setState(() {
                      //     isChecked = value!;
                      //   });
                      // },
                    ),
                    const Text(
                      'Resedential.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      //fillColor: Colors.blue,
                      value: isChecked,
                      shape: const CircleBorder(),
                      onChanged: (bool) {},
                      // onChanged: (bool? value) {
                      //   setState(() {
                      //     isChecked = value!;
                      //   });
                      // },
                    ),
                    const Text(
                      'Commercial.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     'Services:',
                //     style: TextStyle(
                //         fontSize: 20, fontWeight: FontWeight.w600),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   height: 50,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[200],
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey,
                //         blurRadius: 2,
                //         spreadRadius: .2,
                //         offset: Offset(.5, .5),
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('Service Number 01',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                //         Icon(Icons.arrow_forward_ios)
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 15,),
                // Container(
                //   height: 50,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[200],
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey,
                //         blurRadius: 2,
                //         spreadRadius: .2,
                //         offset: Offset(.5, .5),
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('Service Number 02',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                //         Icon(Icons.arrow_forward_ios)
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //   height: 50,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[200],
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey,
                //         blurRadius: 2,
                //         spreadRadius: .2,
                //         offset: Offset(.5, .5),
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('Service Number 03',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                //         Icon(Icons.arrow_forward_ios)
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      height: 50,
                      shape: const StadiumBorder(),
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ServicesSelection()));
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
