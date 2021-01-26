import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.lightGreen,
            )),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 18.0, top: 25.0, right: 18.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Icon(
                  FontAwesomeIcons.cog,
                  color: Colors.lightGreen,
                ),
              ],
            ),
            SizedBox(
              height: 35.0,
            ),
            Row(
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Divider(
              height: 15.0,
              thickness: 2.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            buildAccountOptionRow(
              context,
              'Purchases & Sales',
              Icon(
                FontAwesomeIcons.dollarSign,
                color: Colors.teal,
              ),
            ),
            buildAccountOptionRow(
              context,
              'Payment & Deposit Methods',
              Icon(
                FontAwesomeIcons.creditCard,
                color: Colors.teal,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  "Saves",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Divider(
              height: 15.0,
              thickness: 2.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            buildAccountOptionRow(
              context,
              'Saved items',
              Icon(
                FontAwesomeIcons.heart,
                color: Colors.teal,
              ),
            ),
            buildAccountOptionRow(
              context,
              'Search alerts',
              Icon(
                FontAwesomeIcons.bell,
                color: Colors.teal,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  "Help",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Divider(
              height: 15.0,
              thickness: 2.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            buildAccountOptionRow(
              context,
              'Help',
              Icon(
                FontAwesomeIcons.question,
                color: Colors.teal,
              ),
            ),
            buildAccountOptionRow(
              context,
              'Community Actions',
              Icon(
                FontAwesomeIcons.bolt,
                color: Colors.teal,
              ),
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, Icon icon) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("option 1"),
                  Text("Option 2"),
                  Text("Option 3"),
                ],
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              FontAwesomeIcons.chevronCircleRight,
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
