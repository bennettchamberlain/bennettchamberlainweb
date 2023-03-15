import 'package:bennett_chamberlain/widgets/centered_view/centered_View.dart';
import 'package:bennett_chamberlain/widgets/socials/socials.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/call_to_action/cta.dart';
import '../../widgets/details/details.dart';
import '../../widgets/info/info.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Utils().getScreenSize(context);
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: CenteredView(
        child: Column(
          children: [
            isMobile ? Container() : Navigation_bar(),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Info(),
                      isMobile
                          ? Container()
                          : Center(
                              child: Socials(),
                            ),
                    ],
                  ),
                  isMobile
                      ? Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Socials(),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
