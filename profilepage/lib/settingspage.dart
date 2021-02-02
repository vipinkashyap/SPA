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
            GestureDetector(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                title: Text(
                  'Purchases & Sales',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  FontAwesomeIcons.dollarSign,
                  color: Colors.teal,
                ),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                title: Text(
                  'Payment & Deposit Methods',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  FontAwesomeIcons.creditCard,
                  color: Colors.teal,
                ),
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
            GestureDetector(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                title: Text(
                  'Saved Items',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.teal,
                ),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                title: Text(
                  'Search Alerts',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.teal,
                ),
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
            GestureDetector(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                title: Text(
                  'Help',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  FontAwesomeIcons.question,
                  color: Colors.teal,
                ),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                title: Text(
                  'Community Actions',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  FontAwesomeIcons.bolt,
                  color: Colors.teal,
                ),
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
}
