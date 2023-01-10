import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../projectHome/projecthome.dart';
import 'dart:convert';

List data = [];

class projects extends StatefulWidget {
  const projects({super.key});

  @override
  State<projects> createState() => _projects();
}

Future<List> getData() async {
  final response =
      await http.get(Uri.parse('http://localhost:5000/api/projects'));
  data = json.decode(response.body);
  return data;
}

class _projects extends State<projects> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getData(),
      builder: ((context, snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BuildCard(context, index),
              );
            },
          );
        }
      }),
    );

    /*ListView(itemExtent: 250, physics: FixedExtentScrollPhysics(), children: [
      BuildCard(context),
      BuildCard(context),
      BuildCard(context),
      BuildCard(context),
    ]);*/
  }
}

Widget BuildCard(BuildContext context, int index) {
  return (Center(
      child: Padding(
    padding: EdgeInsets.only(
      left: 12.0,
      right: 12.0,
    ),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => projectHome()));
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 13, 71, 161),
            Color.fromARGB(255, 21, 101, 192),
            Color.fromARGB(255, 66, 165, 245)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  data[index]["title"],
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Avenir',
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'chef de projet',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Avenir',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Date_Debut',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Center(
                        child: Text(
                          'Date_Fin',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    ),
  )));
}
