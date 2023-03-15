import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Utils().getScreenSize(context);
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Im an open book. \n\nLet's Talk.",
          style: TextStyle(
              fontSize: isMobile ? 25 : 60,
              height: 0.9,
              color: Color.fromARGB(255, 115, 16, 87),
              fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 30),
        Text(
          'Email: Chamberlain.Bennett@gmail.com',
          style: TextStyle(
              fontSize: isMobile ? 14 : 25,
              fontWeight: FontWeight.w800,
              height: 1.7),
        )
      ],
    ));
  }
}
