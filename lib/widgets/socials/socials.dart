import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//import material
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../views/contact/contact_view.dart';

class Socials extends StatelessWidget {
  const Socials();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SocialBox(
          "Instagram",
          'https://www.instagram.com/bennett.chamberlain/',
          FaIcon(FontAwesomeIcons.instagram),
        ),
        _SocialBox(
          "Twitter",
          'https://mobile.twitter.com/ogwithsomepulp',
          FaIcon(FontAwesomeIcons.twitter),
        ),
        _SocialBox(
          "LinkedIn",
          'https://www.linkedin.com/in/bennett-chamberlain-300624143/',
          FaIcon(FontAwesomeIcons.linkedin),
        ),
      ],
    );
  }
}

class _SocialBox extends StatelessWidget {
  final String title;
  final String url;
  final FaIcon icon;
  _SocialBox(this.title, this.url, this.icon);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          final Uri _url = Uri.parse(url);
          if (!await launchUrl(_url)) {
            throw "Could not launch $url";
          }
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              child: icon,
            ),
            Text(title)
          ],
        ));
  }
}
