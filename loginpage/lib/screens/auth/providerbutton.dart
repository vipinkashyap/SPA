import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class ProviderButton extends StatefulWidget {
  ProviderButton({@required this.signInType, this.context});

  final String signInType;
  final BuildContext context;
  @override
  _ProviderButtonState createState() => _ProviderButtonState();
}

class _ProviderButtonState extends State<ProviderButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.signInType) {
      case "google":
        return InkWell(
          onTap: () => context.signInWithGoogle(),
          child: Container(
            padding: EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black54,
              ),
            ),
            alignment: Alignment.center,
            child: LitAuthIcon.google(
              size: const Size(30, 30),
            ),
          ),
        );
        break;
      case "apple":
        return InkWell(
          onTap: () => context.signInWithApple(),
          child: Container(
            padding: EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black54,
              ),
            ),
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(-1, 0),
              child: LitAuthIcon.appleBlack(
                size: const Size(30, 30),
              ),
            ),
          ),
        );
        break;
      case "twitter":
        return InkWell(
          onTap: () => context.signInWithTwitter(),
          child: Container(
            padding: EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black54,
              ),
            ),
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 1.4,
              child: LitAuthIcon.twitter(
                size: const Size(30, 30),
              ),
            ),
          ),
        );
        break;
      default:
        return const Text("error");
    }
  }
}
