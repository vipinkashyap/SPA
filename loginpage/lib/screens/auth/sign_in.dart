import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:loginpage/config/palette.dart';
import 'package:loginpage/screens/auth/decoration_functions.dart';
import 'package:loginpage/screens/auth/providerbutton.dart';
import 'package:loginpage/screens/auth/signup_bar.dart';
import 'package:loginpage/screens/auth/title.dart';

class SignIn extends StatelessWidget {
  SignIn({@required this.onRegisterClick});

  final VoidCallback onRegisterClick;

  @override
  Widget build(BuildContext context) {
    final isSubmiting = context.isSubmitting();
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Welcome \n Back',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: EmailTextFormField(
                      decoration: signInInputDecoration(hintText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: PasswordTextFormField(
                      decoration: signInInputDecoration(hintText: 'Password'),
                    ),
                  ),
                  SignInBar(
                      onPressed: () {
                        context.signInWithEmailAndPassword();
                      },
                      label: 'Sign In',
                      isLoading: isSubmiting),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const Text(
                      "or sign in with",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      height: 17.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProviderButton(
                          signInType: "google",
                          context: context,
                        ),
                        ProviderButton(
                          signInType: "apple",
                          context: context,
                        ),
                        ProviderButton(
                          signInType: "twitter",
                          context: context,
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onRegisterClick?.call();
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(color: Colors.black45),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
