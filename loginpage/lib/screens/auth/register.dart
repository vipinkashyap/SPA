import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:loginpage/config/palette.dart';
import 'package:loginpage/screens/auth/decoration_functions.dart';
import 'package:loginpage/screens/auth/signup_bar.dart';
import 'package:loginpage/screens/auth/title.dart';

class Register extends StatelessWidget {
  Register({this.onSignInPressed});
  final VoidCallback onSignInPressed;

  @override
  Widget build(BuildContext context) {
    final isSubmiting = context.isSubmitting();
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Create \n Account',
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
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                      decoration: registerInputDecoration(hintText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: PasswordTextFormField(
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                      decoration: registerInputDecoration(hintText: 'Password'),
                    ),
                  ),
                  SignUpBar(
                      onPressed: () {
                        context.registerWithEmailAndPassword();
                      },
                      label: 'Sign Up',
                      isLoading: isSubmiting),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Palette.lightGreen,
                      onTap: () {
                        onSignInPressed?.call();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
