import 'package:bennett_chamberlain/widgets/centered_view/centered_View.dart';
import 'package:flutter/material.dart';
import '../../widgets/call_to_action/cta.dart';
import '../../widgets/details/details.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: CenteredView(
        child: Column(
          children: [
            Navigation_bar(),
            SizedBox(height: 30),
            Container(
              child: Text(
                "what can I say, I'm an open book man, its pretty cool. This is the about page",
                style: TextStyle(fontSize: 40),
              ),
            )
          ],
        ),
      ),
    );
  }
}
