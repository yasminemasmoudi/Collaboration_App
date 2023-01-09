import 'dart:html';

import 'package:collabapp/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../projects/AddProject.dart';
import '../QRCode/QRCodeScanner.dart';

class AddButtons extends StatelessWidget {
  const AddButtons({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "createproject_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProjectFormScreen();
                  },
                ),
              );
            },
            child: Text(
              "Create Project".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ScanScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(elevation: 0),
          child: Text(
            "Join Project".toUpperCase(),
          ),
        ),
      ],
    );
  }
}
