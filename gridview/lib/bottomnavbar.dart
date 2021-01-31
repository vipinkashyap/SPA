import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NeumorphicBottomNavBar extends StatefulWidget {
  @override
  _NeumorphicBottomNavBarState createState() => _NeumorphicBottomNavBarState();
}

class _NeumorphicBottomNavBarState extends State<NeumorphicBottomNavBar> {
  int selectedIndex = 0;

  List<Color> _bgColor = [
    Colors.green[600],
    Colors.green[600],
    Colors.green[600],
    Colors.green[600],
    Colors.green[600],
  ];

  List<NavigationItem> items = [
    NavigationItem(
      icon: Icon(FontAwesomeIcons.home),
      color: Colors.black54,
    ),
    NavigationItem(
      icon: Icon(FontAwesomeIcons.commentDots),
      color: Colors.black54,
    ),
    NavigationItem(
      icon: Icon(FontAwesomeIcons.cameraRetro),
      color: Colors.black54,
    ),
    NavigationItem(
      icon: Icon(FontAwesomeIcons.dollarSign),
      color: Colors.black54,
    ),
    NavigationItem(
      icon: Icon(FontAwesomeIcons.userAlt),
      color: Colors.black54,
    ),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return Container(
      height: 40.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: isSelected
            ? []
            : [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Colors.grey[500],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
        gradient: isSelected
            ? LinearGradient(colors: [
                Colors.grey[900],
                Colors.grey[700],
                Colors.grey[500],
                Colors.grey[300],
                Colors.grey[100]
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
      ),
      child: IconTheme(
        data: IconThemeData(
          size: 25.0,
          color: isSelected ? item.color : Colors.grey[800],
        ),
        child: item.icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor.elementAt(selectedIndex),
      // body: _navigationScreens.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 75.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            color: Colors.grey[300]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, selectedIndex == itemIndex),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Color color;

  NavigationItem({this.icon, this.color});
}
