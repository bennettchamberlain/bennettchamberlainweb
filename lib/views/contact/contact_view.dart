import 'package:bennett_chamberlain/widgets/centered_view/centered_View.dart';
import 'package:bennett_chamberlain/widgets/socials/socials.dart';
import 'package:flutter/material.dart';
import '../../widgets/call_to_action/cta.dart';
import '../../widgets/details/details.dart';
import '../../widgets/info/info.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: CenteredView(
        child: Column(
          children: [
            Navigation_bar(),
            Expanded(
              child: Row(
                children: [
                  Info(),
                  Expanded(
                    child: Center(
                      child: Socials(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
