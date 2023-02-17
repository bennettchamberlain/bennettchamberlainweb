import 'package:bennett_chamberlain/views/contact/contact_view.dart';
import 'package:bennett_chamberlain/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
//import 'package:vrouter/src/logs/vlogs.dart';

import 'views/about/about_view.dart';

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
          widget: const HomeView(),
        ),
        VWidget(
          path: '/about',
          widget: const AboutView(),
        ),
        VWidget(
          path: '/contact',
          widget: const ContactView(),
        ),
        VWidget(
          path: '/login',
          widget: LoginWidget(),
          stackedRoutes: [
            ConnectedRoutes(), // Custom VRouteElement
          ],
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

// Extend VRouteElementBuilder to create your own VRouteElement
class ConnectedRoutes extends VRouteElementBuilder {
  static const String profile = 'profile';

  static void toProfile(BuildContext context, String username) =>
      context.vRouter.to('/$username/$profile');

  static const String settings = 'settings';

  static void toSettings(BuildContext context, String username) =>
      context.vRouter.to('/$username/$settings');

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VNester.builder(
        // .builder constructor gives you easy access to VRouter data
        path:
            '/:username', // :username is a path parameter and can be any value
        widgetBuilder: (_, state, child) => MyScaffold(
          child,
          currentIndex: state.names.contains(profile) ? 0 : 1,
        ),
        nestedRoutes: [
          VWidget(
            path: profile,
            name: profile,
            widget: ProfileWidget(),
          ),
          VWidget(
            path: settings,
            name: settings,
            widget: SettingsWidget(),

            // Custom transition
            buildTransition: (animation, ___, child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
          ),
        ],
      ),
    ];
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String name = 'bob';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Enter your name to connect: '),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      onChanged: (value) => name = value,
                      initialValue: '',
                      validator: (value) {
                        if (value != "Bennett") {
                          return 'Please enter a valid username.';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // This FAB is shared and shows hero animations working with no issues
            FloatingActionButton(
              heroTag: 'FAB',
              onPressed: () {
                setState(() => (_formKey.currentState!.validate())
                    ? ConnectedRoutes.toProfile(context, name)
                    : null);
              },
              child: const Icon(Icons.login),
            )
          ],
        ),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const MyScaffold(this.child, {super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You are connected'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: 'Info'),
        ],
        onTap: (int index) {
          // We can access this username via the path parameters
          final username = VRouter.of(context).pathParameters['username']!;
          if (index == 0) {
            ConnectedRoutes.toProfile(context, username);
          } else {
            ConnectedRoutes.toSettings(context, username);
          }
        },
      ),
      body: child,

      // This FAB is shared with login and shows hero animations working with no issues
      floatingActionButton: FloatingActionButton(
        heroTag: 'FAB',
        onPressed: () => VRouter.of(context).to('/login'),
        child: const Icon(Icons.logout),
      ),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // VNavigationGuard allows you to react to navigation events locally
    return VWidgetGuard(
      // When entering or updating the route, we try to get the count from the local history state
      // This history state will be NOT null if the user presses the back button for example
      afterEnter: (context, __, ___) => getCountFromState(context),
      afterUpdate: (context, __, ___) => getCountFromState(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  VRouter.of(context).to(
                    context.vRouter.url,
                    isReplacement: true,
                    historyState: {'count': '${count + 1}'},
                  );
                  setState(() => count++);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueAccent,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: Text(
                    'Your pressed this button $count times',
                    style: buttonTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'This number is saved in the history state so if you are on the web leave this page and hit the back button to see this number restored!',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCountFromState(BuildContext context) {
    setState(() {
      count = (VRouter.of(context).historyState['count'] == null)
          ? 0
          : int.tryParse(VRouter.of(context).historyState['count'] ?? '') ?? 0;
    });
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Did you see the custom animation when coming here?',
              style: textStyle.copyWith(fontSize: textStyle.fontSize! + 2),
            ),
          ],
        ),
      ),
    );
  }
}

const textStyle = TextStyle(color: Colors.black, fontSize: 16);
final buttonTextStyle = textStyle.copyWith(color: Colors.white);

// import 'package:bennett_chamberlain/views/about/about_view.dart';
// import 'package:flutter/material.dart';
// import 'views/contact/contact_view.dart';
// import 'views/home/home_view.dart';
// import 'package:vrouter/vrouter.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

// void main() {
//   //usePathUrlStrategy();
//   runApp(
//     VRouter(
//       debugShowCheckedModeBanner: false, // VRouter acts as a MaterialApp
//       mode: VRouterMode.history, // Remove the '#' from the url
//       // logs: [VLogLevel.info], // Defines which logs to show, info is the default
//       routes: [
//         VWidget(
//           path: '/',
//           widget: HomeView(),
//           stackedRoutes: [
//             //ConnectedRoutes(), //Custom VRoute (find in Vrouter pub example)
//             VWidget(path: '/about', widget: AboutView()),
//             VWidget(path: '/contact', widget: ContactView()),
//           ],
//         ),
//         // This redirect every unknown routes to /login
//         VRouteRedirector(
//           redirectTo: '/',
//           path: r'*',
//         ),
//       ],
//     ),
//   );
// }
