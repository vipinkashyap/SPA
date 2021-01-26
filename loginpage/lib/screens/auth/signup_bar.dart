import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginpage/config/palette.dart';
import 'package:loginpage/screens/auth/sign_in.dart';

class SignUpBar extends StatelessWidget {
  const SignUpBar(
      {@required this.onPressed,
      @required this.label,
      @required this.isLoading});

  final VoidCallback onPressed;
  final String label;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _ContinueButton(onPressed: onPressed),
        ],
      ),
    );
  }
}

class SignInBar extends StatelessWidget {
  const SignInBar(
      {@required this.onPressed,
      @required this.label,
      @required this.isLoading});

  final VoidCallback onPressed;
  final String label;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Palette.darkGreen,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _ContinueButton(onPressed: onPressed),
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({@required this.isLoading});

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100.0),
      child: Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(
          backgroundColor: Palette.lightCyan,
        ),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({@required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      fillColor: Palette.lightGreen,
      splashColor: Palette.darkGreen,
      padding: EdgeInsets.all(22.0),
      shape: const CircleBorder(),
      child: const Icon(
        FontAwesomeIcons.caretRight,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
