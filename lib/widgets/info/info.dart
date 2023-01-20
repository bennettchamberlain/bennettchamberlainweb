import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Im an open book. \n\nLet's Talk.",
              style: TextStyle(
                  fontSize: 60,
                  height: 0.9,
                  color: Color.fromARGB(255, 115, 16, 87),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 30),
            Text(
              'Email: Chamberlain.Bennett@gmail.com',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w800, height: 1.7),
            )
          ],
        ));
  }
}
