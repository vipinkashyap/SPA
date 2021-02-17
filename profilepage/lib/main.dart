import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profilepage/edit_profilepage.dart';

import 'button.dart';
import 'buttontapped.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var icons1 = FontAwesomeIcons.home;
  var icons2 = FontAwesomeIcons.cameraRetro;
  var icons3 = FontAwesomeIcons.sellcast;
  var icons4 = FontAwesomeIcons.userAlt;

  //

  bool buttonPressed1 = false;
  bool buttonPressed2 = false;
  bool buttonPressed3 = false;
  bool buttonPressed4 = false;

  void _letsPress1() {
    setState(() {
      buttonPressed1 = true;
      buttonPressed2 = false;
      buttonPressed3 = false;
      buttonPressed4 = false;
    });
  }

  void _letsPress2() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = true;
      buttonPressed3 = false;
      buttonPressed4 = false;
    });
  }

  void _letsPress3() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = false;
      buttonPressed3 = true;
      buttonPressed4 = false;
    });
  }

  void _letsPress4() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = false;
      buttonPressed3 = false;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        buttonPressed4 = true;
        return settingsUI();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                        // FIRST BUTTON
                        onTap: _letsPress1,
                        child: buttonPressed1
                            ? ButtonTapped(
                                icon: icons1,
                              )
                            : MyButton(
                                icon: icons1,
                              )),
                  ),
                  Expanded(
                    child: GestureDetector(
                      // SECOND BUTTON
                      onTap: _letsPress2,
                      child: buttonPressed2
                          ? ButtonTapped(
                              icon: icons2,
                            )
                          : MyButton(
                              icon: icons2,
                            ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      // THIRD BUTTON
                      onTap: _letsPress3,
                      child: buttonPressed3
                          ? ButtonTapped(
                              icon: icons3,
                            )
                          : MyButton(
                              icon: icons3,
                            ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: _letsPress4,
                      child: buttonPressed4
                          ? ButtonTapped(
                              icon: icons4,
                            )
                          : MyButton(
                              icon: icons4,
                            ),
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
