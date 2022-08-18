import 'package:design/components/background.dart';
import 'package:flutter/material.dart';

class VerifyDocuments extends StatefulWidget {
  const VerifyDocuments({Key key}) : super(key: key);

  @override
  State<VerifyDocuments> createState() => _VerifyDocumentsState();
}

class _VerifyDocumentsState extends State<VerifyDocuments> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
        child: Center(
          child: Text('Verification Page'),
        ),
      ),
    );
  }
}
