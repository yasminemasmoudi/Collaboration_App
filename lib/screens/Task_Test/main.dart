import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/home.dart';
import 'package:flutter/services.dart';
import 'package:collabapp/resources/color_manager.dart';


Future main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyCAzgzQBVvmAnvPVyNKby1j7zZiCzRSAVA",
    appId: "1:826791224015:android:980ef2006c91e7c19c4dba",
    messagingSenderId: "826791224015",
    projectId: "collabapp-1567f",),);
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorManager.primary,
      ),
      home: const HomeScreen(),
    );
  }
}
