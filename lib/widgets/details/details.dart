import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../call_to_action/cta.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Utils().getScreenSize(context);
    return Container(
        width: isMobile ? null : 600,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bennett Chamberlain. \n\nSoftware Engineer.",
                style: TextStyle(
                    fontSize: isMobile ? 25 : 80,
                    height: 0.9,
                    color: Color.fromARGB(255, 115, 16, 87),
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              Text(
                "Flutter, Python, C++",
                style: TextStyle(
                    fontSize: isMobile ? 11 : 18,
                    height: 0.9,
                    color: Color.fromARGB(255, 115, 16, 87),
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 30),
              isMobile ? const cta("Contact Me") : Container(),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Macroeconomics. Skiing. Music. Journaling. Billiards. Algorithmic Trading. Basketball. Guitar. Mountain Biking. Art. Golf. Hiking. Tennis. Surfing. Poker. Reading. Cooking. Yoga. French. Dancing.',
                  style: TextStyle(
                      fontSize: isMobile ? 11 : 18,
                      fontWeight: FontWeight.w500,
                      height: 1.7),
                ),
              ),
            ],
          ),
        ));
  }
}
