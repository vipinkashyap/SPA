import 'package:flutter/material.dart';
import 'package:gridview/giphysearch.dart';
import 'categorydrawerscreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CategoryDrawerScreen(),
          GiphySearchPage(),
        ],
      ),
    );
  }
}
