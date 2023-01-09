import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './projectBox.dart';

import 'project.dart';

class ProjectFormScreen extends StatefulWidget {
  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final ownerController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    ownerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New project"),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: ownerController,
                  decoration: InputDecoration(
                      labelText: 'members',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please the number of members';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      project Project = project(
                          titleController.value.text,
                          ownerController.value.text,
                          descriptionController.value.text,
                          new Random().nextInt(100));

                      projectBox.box.put(Project.key(), project);
                      Navigator.pop(context);
                    }
                    
                  },
                  child: Text('Save'),
                ),
              )
            ],
          )),
    );
  }
}
