import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profilepage/settingspage.dart';

class settingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings UI',
      debugShowCheckedModeBanner: false,
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2.0,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.lightGreen,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.cog,
              color: Colors.lightGreen,
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPage()));
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 18.0, top: 25.0, right: 18.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5.0,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2.0,
                            blurRadius: 8.0,
                            color: Colors.black54.withOpacity(0.2),
                            offset: Offset(0, -3),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://cdn3.f-cdn.com/contestentries/1376995/30494909/5b566bc71d308_thumb900.jpg"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5.0,
                            color: Colors.black54.withOpacity(0.2),
                          ),
                          color: Colors.lightGreen,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              buildTextField("Full Name", "Varun Kashyap", false),
              buildTextField("Email", "Varun9729@gmail.com", false),
              buildTextField("Password", "*******", true),
              buildTextField("Location", "Springfield, IL", false),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 2.0,
                          color: Colors.black),
                    ),
                  ),
                  RaisedButton(
                    elevation: 2.0,
                    color: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 28.0,
      ),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    FontAwesomeIcons.eye,
                    color: Colors.teal,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(
            bottom: 3.0,
          ),
          labelText: "Full Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
