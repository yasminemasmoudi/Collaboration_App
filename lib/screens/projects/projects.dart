import 'package:flutter/material.dart';

class projects extends StatefulWidget {
  const projects({super.key});

  @override
  State<projects> createState() => _projects();
}

class _projects extends State<projects> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        itemExtent: 250,
        physics: FixedExtentScrollPhysics(),
        children: [
          BuildCard(),
          BuildCard(),
          BuildCard(),
          BuildCard(),
        ]);
  }
}

BuildCard() {
  return (Center(
    child: Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
      ),
      child: Container(
        height: 150,
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
                  'project1',
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
    ),
  ));
}
