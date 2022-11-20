import 'package:collabapp/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ProjectDashboard extends StatelessWidget {
  Items item1 = Items(title: "Tasks", img: "assets/images/tasks.png");

  Items item2 = Items(
    title: "Members",
    img: "assets/images/members.png",
  );
  Items item3 = Items(
    title: "Chat",
    img: "assets/images/chat.png",
  );
  Items item4 = Items(
    title: "Reminders",
    img: "assets/images/Reminders.png",
  );

  ProjectDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = ColorManager.button;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: ColorManager.lightblue,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 50,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 2, 2, 2),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items({required this.title, required this.img});
}
