import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Bennett Chamberlain. \n\nSoftware Engineer.",
              style: TextStyle(
                  fontSize: 80,
                  height: 0.9,
                  color: Color.fromARGB(255, 115, 16, 87),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 10),
            Text(
              "Flutter, Python, C++",
              style: TextStyle(
                  fontSize: 18,
                  height: 0.9,
                  color: Color.fromARGB(255, 115, 16, 87),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 30),
            Text(
              'Macroeconomics. Skiing. Music. Journaling. Billiards. Algorithmic Trading. Basketball. Guitar. Mountain Biking. Art. Golf. Hiking. Tennis. Surfing. Poker. Reading. Cooking. Yoga. French. Dancing.',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, height: 1.7),
            )
          ],
        ));
  }
}
