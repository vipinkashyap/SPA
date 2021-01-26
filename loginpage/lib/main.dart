import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:loginpage/config/palette.dart';
import 'package:loginpage/screens/auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginpage/screens/auth/home.dart';
import 'package:loginpage/screens/auth/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return LitAuthInit(
            authProviders: const AuthProviders(
              emailAndPassword: true,
              google: true,
              apple: true,
              twitter: true,
            ),
            child: MaterialApp(
              title: 'Material App',
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: GoogleFonts.hindTextTheme(),
                accentColor: Palette.lightGreen,
                appBarTheme: const AppBarTheme(
                  brightness: Brightness.dark,
                  color: Palette.lightGreen,
                ),
              ),
              // home: LitAuthState(
              //     authenticated: HomeScreen(), unauthenticated: AuthScreen()),
              home: SplashScreen(),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
