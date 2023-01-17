import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//import material
import 'package:flutter/material.dart';

class cta extends StatelessWidget {
  final String title;
  const cta(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 115, 16, 87),
            borderRadius: BorderRadius.circular(5)));
  }
}
