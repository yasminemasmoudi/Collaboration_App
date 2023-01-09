import 'dart:js';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import '../projects/projects.dart';
import '../projects/AddProject.dart';
import '../projectHome/add.dart';

class projectsView extends StatelessWidget {
  const projectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(top: 3),
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
          // on pressed should redirect to ProjectFormScreen !!!!!!!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHome()),
          );
        },
      ),
    );
  }
}
