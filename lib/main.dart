import 'package:flutter/material.dart';

import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

//need to add responsive view
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bennett Chamberlain Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Helvetica'),
      ),
      home: HomeView(),
    );
  }
}
