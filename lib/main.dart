import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/Test/Test.dart';
import 'screens/AuthPage/AuthPage.dart';
import 'screens/utils/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyAL4g1gU8_vPyn6BPvBlGOuYX1nB2Urlrg",
    appId: "1:880888729591:android:003c26a3cb0c7c852ee8f2",
    messagingSenderId: "880888729591",
    projectId: "collab-eaa34",),);
  runApp(MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
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
           return Test(); //just for test, we will change it after to HomePage
        }
        else
        {
          return AuthPage();
        }
      },
    )
  );
}