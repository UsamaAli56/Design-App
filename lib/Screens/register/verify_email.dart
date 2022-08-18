import 'dart:async';

import 'package:design/Screens/dashboard_page.dart';
import 'package:design/components/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer timer;
  bool canResendEmail = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // Future checkEmailVerified() async {
  //   await FirebaseAuth.instance.currentUser.reload();
  //   setState(() {
  //     isEmailVerified = FirebaseAuth.instance.currentUser.emailVerified;
  //   });
  //   if (isEmailVerified) timer.cancel();
  // }

  // sendVerificationEmail() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     await user.sendEmailVerification();
  //     setState(() {
  //       canResendEmail = false;
  //     });
  //     await Future.delayed(Duration(seconds: 5));
  //     setState(() {
  //       canResendEmail = true;
  //     });
  //   } catch (e) {
  //     SnackBar(
  //       content: Text(e.toString()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? DashboardPage()
      : Scaffold(
          body: Background(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified_user_outlined,
                    color: Colors.green,
                    size: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Verification Email Sent To Your Email Address.',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Please Verify Your Email.',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                      icon: (Icon(Icons.email, size: 32)),
                      label: Text(
                        'Resend Email',
                        style: TextStyle(fontSize: 24),
                      ),
                      // onPressed: canResendEmail ? sendVerificationEmail : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                      icon: (Icon(Icons.cancel, size: 32)),
                      label: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
