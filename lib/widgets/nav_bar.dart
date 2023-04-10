import 'package:bc_website/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 6,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "BENNETT CHAMBERLAIN",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                xOffsetProvider.value = 290;
                yOffsetProvider.value = 80;
                isDrawerOpenProvider.value = true;
                setState(() {});
              },
              icon: const Icon(Icons.menu, size: 35),
            ),
          ),
        ),
      ],
    );
  }
}
