

import 'package:design/components/background.dart';
import 'package:flutter/material.dart';

class InformationComplete extends StatefulWidget {
  const InformationComplete({Key key}) : super(key: key);

  @override
  State<InformationComplete> createState() => _InformationCompleteState();
}

class _InformationCompleteState extends State<InformationComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.check_circle_outline,size: 160,color: Colors.green,),
              Text('Information Successfully Uploaded',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
              SizedBox(height: 5,),
              Text('Please wait for Verification, It might take Upto 48 Hours.',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
  }
}
