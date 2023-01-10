import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collabapp/resources/color_manager.dart';

class reminders extends StatefulWidget {
  const reminders({super.key});

  @override
  State<reminders> createState() => _reminders();
}

class _reminders extends State<reminders> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Reminders'),
          centerTitle: true,
        ),
        body: ListWheelScrollView(
            itemExtent: 250,
            physics: FixedExtentScrollPhysics(),
            perspective: 0.004,
            children: [
              BuildCard(),
              BuildCard(),
              BuildCard(),
              BuildCard(),
            ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //the function that show the pop up !
            showDialog(
              context: context,
              //Create (Alert==POPUP)
              builder: (context) => AlertDialog(
                title: Text("Add a reminder !"),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Don' 't forget ...'),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        //the function that remove the pop up !
                        Navigator.of(context).pop();
                      },
                      child: Text("ok"))
                ],
              ),
            );
            ;
          },
        ),
      ),
    );
  }
}

BuildCard() {
  return (Center(
    child: Container(
      height: 500,
      width: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 112, 166, 242),
          Color.fromARGB(255, 196, 211, 245)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: [
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
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
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

void temp() {
  print('Floating Action Button Clicked');
}
