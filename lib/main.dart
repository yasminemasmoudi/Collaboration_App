import 'package:collabapp/screens/Home/home.dart';
import 'package:collabapp/screens/OTP/Verification_otp.dart';
import 'package:collabapp/screens/OTP/function.dart';
import 'package:collabapp/screens/OTP/phone_otp.dart';
import 'package:collabapp/screens/Onboarding/onboarding.dart';
import 'package:collabapp/screens/Reminders/reminders.dart';
import 'package:collabapp/screens/Splash/splashscreen.dart';
import 'package:collabapp/screens/draw.dart';
import 'package:collabapp/screens/Events/event_list.dart';
import 'package:collabapp/screens/promodoro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCAzgzQBVvmAnvPVyNKby1j7zZiCzRSAVA",
      appId: "1:826791224015:android:980ef2006c91e7c19c4dba",
      messagingSenderId: "826791224015",
      projectId: "collabapp-1567f",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Reminders(),
      /*StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.data == null ? Phone() : const Home();
        },
      ),*/
    );
  }
}
