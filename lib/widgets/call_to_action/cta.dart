import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//import material
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../views/contact/contact_view.dart';

class cta extends StatelessWidget {
  final String title;
  const cta(this.title);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.vRouter.to('/contact');
          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (context, animation, seconaryAnimation) =>
          //         ContactView(),
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) {
          //       var begin = Offset(300.0, 0.0);
          //       var end = Offset.zero;
          //       var curve = Curves.bounceIn;
          //       var tween = Tween(begin: begin, end: end)
          //           .chain(CurveTween(curve: curve));
          //       return SlideTransition(
          //           position: animation.drive(tween), child: child);
          //     },
          //   ),
          // );
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 115, 16, 87),
                borderRadius: BorderRadius.circular(5))));
  }
}
