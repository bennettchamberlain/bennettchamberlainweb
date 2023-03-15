import 'package:bennett_chamberlain/widgets/centered_view/centered_View.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/call_to_action/cta.dart';
import '../../widgets/details/details.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
              child: Row(
                children: [
                  const Details(),
                  isMobile
                      ? Container()
                      : Expanded(
                          child: Center(
                            child: cta('Contact Me'),
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
