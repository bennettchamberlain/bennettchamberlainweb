import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Navigation_bar extends StatelessWidget {
  const Navigation_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("BC",
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 115, 16, 87),
                      fontWeight: FontWeight.w800)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _NavBarItem("Home"),
              SizedBox(width: 60),
              _NavBarItem("About"),
              SizedBox(width: 60),
              _NavBarItem("Contact"),
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 20));
  }
}
