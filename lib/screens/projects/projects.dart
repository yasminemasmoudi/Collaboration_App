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
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'project1',
                style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 21),
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
                    color: Color.fromARGB(255, 24, 21, 21),
                    fontFamily: 'Avenir',
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    ),
  )));
}
