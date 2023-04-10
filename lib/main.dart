import 'package:bc_website/views/drawer_view.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'views/home_view.dart';

void main() {
  runApp(
    VRouter(
      theme: ThemeData(fontFamily: 'Helvetica'),
      debugShowCheckedModeBanner: false, // VRouter acts as a MaterialApp
      mode: VRouterMode.history, // Remove the '#' from the url
      // logs: [VLogLevel.info], // Defines which logs to show, info is the default
      routes: [
        VWidget(
          path: '/',
          widget: Scaffold(
            body: Stack(
              children: [
                DrawerView(),
                HomeView(),
              ],
            ),
          ),
        ),

        // This redirect every unknown routes to /
        VRouteRedirector(
          redirectTo: '/',
          path: r'*',
        ),
      ],
    ),
  );
}
