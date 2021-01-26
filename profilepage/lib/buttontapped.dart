import 'package:flutter/material.dart';

class ButtonTapped extends StatelessWidget {
  var icon;

  ButtonTapped({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        padding: EdgeInsets.all(4),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Icon(
            icon,
            size: 25,
            color: Colors.blueGrey[800],
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[600],
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 8.0,
                  spreadRadius: 0.5),
              BoxShadow(
                  color: Colors.blueGrey[300],
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 8.0,
                  spreadRadius: 0.5),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[600],
                Colors.grey[400],
                Colors.grey[200],
                Colors.grey[100],
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey[300],
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey[600],
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
              Colors.grey[100],
              Colors.grey[300],
              Colors.grey[500],
              Colors.grey[700],
            ],
          ),
        ),
      ),
    );
  }
}
