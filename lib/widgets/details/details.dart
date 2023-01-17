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
            SizedBox(height: 30),
            Text(
              'This font can be utilized without purchasing any license for non-commercial projects. However, for any commercial purpose, you will have to purchase the license in order to use it legally. Just buy its license from any reliable source and start using it for all your commercial purposes.',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, height: 1.7),
            )
          ],
        ));
  }
}
