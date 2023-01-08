import 'dart:html';

import 'package:collabapp/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AddButtons extends StatelessWidget {
  AddButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: (Stack(
      children: <Widget>[
        Positioned(
            top: 114,
            left: 4,
            child: Container(
                width: 319,
                height: 63,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.5),
                    topRight: Radius.circular(31.5),
                    bottomLeft: Radius.circular(31.5),
                    bottomRight: Radius.circular(31.5),
                  ),
                  color: Color.fromARGB(255, 195, 198, 204),
                ),
                child: Text(
                  'Join a project',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(245, 244, 242, 1),
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ))),
        Positioned(
            top: 10,
            left: 23,
            child: Text(
              'Join a project',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(245, 244, 242, 1),
                  fontSize: 18,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 124,
            left: 29,
            child: Text(
              'create a project',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(245, 244, 242, 1),
                  fontSize: 18,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
      ],
    )));
  }
}
