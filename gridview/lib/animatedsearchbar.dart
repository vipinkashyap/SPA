import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _isFolded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _isFolded ? 50 : 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: !_isFolded
                      ? TextField(
                          decoration: InputDecoration(
                              hintText: 'Search Products',
                              hintStyle: TextStyle(color: Colors.blue[500]),
                              border: InputBorder.none),
                        )
                      : null,
                ),
              ),
              Container(
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_isFolded ? 30 : 0),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(_isFolded ? 30 : 0),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        _isFolded ? Icons.search : Icons.close,
                        color: Colors.blue[800],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isFolded = !_isFolded;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
