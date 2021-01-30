import 'package:flutter/material.dart';
import 'package:gridview/animatedsearchbar.dart';
import 'package:gridview/giphysearch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePageScreen',
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GiphySearchPage(),
    );
  }
}
