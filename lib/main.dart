import 'package:collabapp/screens/Calender/calender_view.dart';
import 'package:collabapp/screens/Home/home.dart';
import 'package:collabapp/screens/Login/login.dart';
import 'package:collabapp/screens/OTP/Phone.dart';
import 'package:collabapp/screens/OTP/Verif.dart';
import 'package:collabapp/screens/Onboarding/onboarding.dart';
import 'package:collabapp/screens/Splash/splashscreen.dart';
import 'package:collabapp/screens/draw.dart';
import 'package:collabapp/screens/projectsView.dart';
import 'package:collabapp/screens/reminders.dart';
import 'package:collabapp/screens/wrapper.dart';
import 'package:collabapp/screens/Events/event_list.dart';
import 'package:collabapp/screens/Calender/calender_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventListScreen(),
    );
  }
}
