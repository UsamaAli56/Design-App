import 'package:design/Screens/ongoing_services.dart';
import 'package:design/components/background.dart';
import 'package:flutter/material.dart';

class RecepitsUploadSuccessfull extends StatelessWidget {
  const RecepitsUploadSuccessfull({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                Icons.check_circle_outline,
                size: 160,
                color: Colors.green,
              ),
              Text(
                'Receipts Successfully Uploaded',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Please wait for Verification, It might take Up-to 48 Hours.',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15,),
              FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OngoingServices()));
                  },
                  child: Text(
                    'Track Your Order',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                  ),
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
