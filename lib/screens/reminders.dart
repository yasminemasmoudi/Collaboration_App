import 'package:flutter/material.dart';
import 'package:collabapp/resources/color_manager.dart';

class reminders extends StatefulWidget {
  const reminders({super.key});

  @override
  State<reminders> createState() => _reminders();
}

class _reminders extends State<reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          title: const Text('Reminders'),
          centerTitle: true,
        ),
        body: ListWheelScrollView(
            itemExtent: 250,
            physics: const FixedExtentScrollPhysics(),
            perspective: 0.004,
            children: [
              BuildCard(),
              BuildCard(),
              BuildCard(),
              BuildCard(),
            ]));
  }
}

// ignore: non_constant_identifier_names
BuildCard() {
  return (Center(
    child: Container(
      height: 500,
      width: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 112, 166, 242),
          Color.fromARGB(255, 196, 211, 245)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 238, 241, 245),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 30.0, left: 12.0, right: 12.0, bottom: 9.0),
              child: Text(
                'Do not forget the meeting on Monday',
                style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 21),
                    fontFamily: 'Avenir',
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
