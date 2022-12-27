import 'package:flutter/material.dart';
import 'package:collabapp/resources/color_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyCAzgzQBVvmAnvPVyNKby1j7zZiCzRSAVA",
    appId: "1:826791224015:android:980ef2006c91e7c19c4dba",
    messagingSenderId: "826791224015",
    projectId: "collabapp-1567f",),);
  runApp(MaterialApp(
    home: Tasks(),
  ));
}


 class Tasks extends StatefulWidget {
  @override
   _Tasks createState() => _Tasks();
 }

 class _Tasks extends State<Tasks>{
    String inputTodo = "";
    List todos = [];
    createTodos(){
      DocumentReference documentReference = FirebaseFirestore.instance.collection("MyTodos").doc(inputTodo);
      Map<String,String> todos = {
        "todoTitle":inputTodo
      };
      documentReference.set(todos).whenComplete(() => print("$inputTodo created"));
    }
    deleteTodos(){

    }
    @override
   Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                ColorManager.button,
                ColorManager.primary,
                ColorManager.blue
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Image(image: AssetImage('assets/images/logoapp.png')), //change the path in github
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Tasks to do",
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
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
                      builder: (context, AsyncSnapshot snapshots) {
                          return ListView.builder(
                            itemCount: todos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                key: Key(todos[index]),
                                child: Card(
                                  elevation: 4,
                                  margin: EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: ListTile(
                                    title: Text(todos[index]),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          todos.removeAt(index);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      },
                )
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      title: Text("Add Todo"),
                      content: TextField(
                        onChanged: (String value){
                          inputTodo = value;
                        },
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              todos.add(inputTodo);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"),
                        ),
                      ],
                  );
                }),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      );
    }
 }