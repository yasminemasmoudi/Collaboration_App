import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collabapp/resources/color_manager.dart';
import 'dart:convert';
import 'dart:async';

List data = [];

class reminders extends StatefulWidget {
  const reminders({super.key});

  @override
  State<reminders> createState() => _reminders();
}

Future<List> getData() async {
  final response = await http
      .get(Uri.parse('https://backendmobile-tje6.onrender.com/api/reminders'));
  data = json.decode(response.body);
  print(data.length);
  return data;
}

Future<Project> createReminder(
  BuildContext context,
  String text,
) async {
  try {
    var url;
    url = 'https://backendmobile-tje6.onrender.com/api/reminders';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'text': text,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return User.fromJson(jsonDecode(response.body));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => reminders()));
      return Project(
        text: "",
      );
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.body);
    }
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
            e.toString(),
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return Project(text: "");
  }
}

class Project {
  final String text;

  const Project({
    required this.text,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      text: json['text'],
    );
  }
}

class _reminders extends State<reminders> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Reminders'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getData(),
            builder: ((context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Text("No reminders"),
                );
              } else {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return BuildCard(context, index);
                  },
                );
              }
            })),
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

Future DeleteReminder(
  BuildContext context,
  String id,
) async {
  try {
    var url = 'https://backendmobile-tje6.onrender.com/api/reminders/';
    url = url + id;
    final response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return User.fromJson(jsonDecode(response.body));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => reminders()));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.body);
    }
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _textcontroller = TextEditingController();
        return AlertDialog(
          title: Text('Error'),
          content: TextField(
            controller: _textcontroller,
            decoration: const InputDecoration(hintText: 'Enter Text'),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('ok'),
              onPressed: () {
                createReminder(
                  context,
                  _textcontroller.text,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

BuildCard(BuildContext context, int index) {
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
          IconButton(
            icon: Icon(Icons.delete, color: Colors.blueAccent[200]),
            onPressed: () {
              DeleteReminder(context, data[index]["id"]);
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 12.0, right: 12.0, bottom: 9.0),
              child: Text(
                data[index]["text"],
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

// we will be creating a widget for text field
Widget inputFile({
  label,
  obscureText = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(50),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(50),
            )),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}

void temp() {
  print('Floating Action Button Clicked');
}
