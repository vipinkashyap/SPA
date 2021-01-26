import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  var icon;

  MyButton({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Icon(
          icon,
          size: 25,
          color: Colors.blueGrey[600],
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey[300],
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey[800],
                offset: Offset(4.0, 4.0),
                blurRadius: 8.0,
                spreadRadius: 0.5),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 8.0,
                spreadRadius: 0.5),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey[300],
              Colors.blueGrey[400],
              Colors.blueGrey[500],
              Colors.blueGrey[600],
            ],
          ),
        ),
      ),
    );
  }
}
