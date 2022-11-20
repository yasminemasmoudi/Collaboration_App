import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collabapp/resources/color_manager.dart';
import 'projectdashboard.dart';

class projectHome extends StatefulWidget {
  const projectHome({super.key});

  @override
  State<projectHome> createState() => _projectHomeState();
}

class _projectHomeState extends State<projectHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 110,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Project name",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Project manager",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 226, 225, 228),
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text(
                      "Project members list",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 226, 225, 228),
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, bottom: 2.0, top: 2.0),
                      height: 28.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      child: Text(
                        "Feb 2022 - Jan 2023",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 226, 225, 228),
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ProjectDashboard()
        ],
      ),
    );
  }
}
