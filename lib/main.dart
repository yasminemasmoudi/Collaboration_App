import 'package:collabapp/screens/calendar/calender_view.dart';
import 'package:collabapp/screens/Home/home.dart';
import 'package:collabapp/screens/Login/login.dart';
import 'package:collabapp/screens/OTP/Phone.dart';
import 'package:collabapp/screens/OTP/Verif.dart';
import 'package:collabapp/screens/Onboarding/onboarding.dart';
import 'package:collabapp/screens/Splash/splashscreen.dart';
import 'package:collabapp/screens/wrapper.dart';
import 'package:collabapp/screens/Events/event.dart';
import 'package:collabapp/screens/calendar/calender_view.dart';
import 'package:flutter/material.dart';
import 'screens/AuthPage/AuthPage.dart';
import 'screens/ChangePass/ChangePass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyAL4g1gU8_vPyn6BPvBlGOuYX1nB2Urlrg",
    appId: "1:880888729591:android:003c26a3cb0c7c852ee8f2",
    messagingSenderId: "880888729591",
    projectId: "collab-eaa34",),);
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget{
  @override
  Widget build (BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
           return Onboarding(); //just for test, we will change it after to HomePage
        }
        else
        {
          return AuthPage();
        }
      },
    )
  );
}
