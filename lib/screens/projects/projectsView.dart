import 'dart:js';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import '../projects/projects.dart';

class projectsView extends StatelessWidget {
  const projectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.blue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Projects",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: projects(),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //the function that show the pop up !
            showDialog(
              context: context,
              //Create (Alert==POPUP)
              builder: (context) => AlertDialog(
                title: Text("What ever you want !"),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Enter your name'),
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

void temp() {
  print('Floating Action Button Clicked');
}
