import 'package:collabapp/screens/Splash/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:collabapp/screens/AuthPage/AuthPage.dart';
import 'package:collabapp/screens/utils/utils.dart';
import 'package:collabapp/screens/Home/home.dart';

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
  runApp(MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return AuthPage();
          }
        },
      ));
}
