import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:loginpage/config/palette.dart';
import 'package:loginpage/screens/auth/backgroundpainter.dart';
import 'package:loginpage/screens/auth/home.dart';
import 'package:loginpage/screens/auth/sign_in.dart';
import 'register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/animation.dart';

class AuthScreen extends StatefulWidget {
  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => AuthScreen(),
      );
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LitAuth.custom(
        errorNotification: NotificationConfig(
          backgroundColor: Palette.lightGreen,
          icon: Icon(
            Icons.error_outline,
            color: Palette.lightGreen,
            size: 30.0,
          ),
        ),
        successNotification: NotificationConfig(
          backgroundColor: Palette.darkGreen,
          icon: Icon(
            Icons.check,
            size: 30.0,
          ),
        ),
        onAuthSuccess: () {
          Navigator.of(context).pushReplacement(HomeScreen.route);
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackgroundPainter(
                  animation: _controller.view,
                ),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: ValueListenableBuilder<bool>(
                  valueListenable: showSignInPage,
                  builder: (context, value, child) {
                    return value
                        ? SignIn(
                            onRegisterClick: () {
                              print(context);
                              context.resetSignInForm();
                              showSignInPage.value = false;
                              _controller.forward();
                            },
                          )
                        : Register(
                            onSignInPressed: () {
                              print(context);
                              context.resetSignInForm();
                              showSignInPage.value = true;
                              _controller.reverse();
                            },
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
