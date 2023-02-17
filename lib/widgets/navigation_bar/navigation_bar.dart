import 'package:bennett_chamberlain/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vrouter/vrouter.dart';

import '../../views/about/about_view.dart';
import '../../views/contact/contact_view.dart';

class Navigation_bar extends StatelessWidget {
  const Navigation_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            height: 80,
            width: 150,
            child: Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text("BC",
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 115, 16, 87),
                      fontWeight: FontWeight.w800)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _NavBarItem(
                  Text(
                    "Home",
                    style: TextStyle(
                        color: Color.fromARGB(255, 115, 16, 87), fontSize: 20),
                  ),
                  '/'),
              SizedBox(width: 60),
              _NavBarItem(
                  Text(
                    "About",
                    style: TextStyle(
                        color: Color.fromARGB(255, 115, 16, 87), fontSize: 20),
                  ),
                  '/about'),
              SizedBox(width: 60),
              _NavBarItem(
                  Text(
                    "Contact",
                    style: TextStyle(
                        color: Color.fromARGB(255, 115, 16, 87), fontSize: 20),
                  ),
                  '/contact'),
              SizedBox(
                width: 50,
              ),
              _NavBarItem(
                  FaIcon(
                    FontAwesomeIcons.user,
                    color: Color.fromARGB(255, 115, 16, 87),
                  ),
                  '/login')
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final Widget title;
  final String pageUrl;
  const _NavBarItem(this.title, this.pageUrl);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 115, 16, 87).withOpacity(0.5);
            }
            return null; // Use the component's default.
          },
        ),
      ),
      onPressed: () {
        context.vRouter.to('$pageUrl');
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     pageBuilder: (context, animation, seconaryAnimation) => pageWidget,
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       var begin = Offset(300.0, 0.0);
        //       var end = Offset.zero;
        //       var curve = Curves.bounceIn;
        //       var tween =
        //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //       return SlideTransition(
        //           position: animation.drive(tween), child: child);
        //     },
        //   ),
        // );
      },
      child: this.title,
    );
  }
}
