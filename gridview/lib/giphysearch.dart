import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class GiphySearchPage extends StatefulWidget {
  @override
  _GiphySearchPageState createState() => _GiphySearchPageState();
}

class _GiphySearchPageState extends State<GiphySearchPage> {
  int selectedIndex = 0;
  bool _isFolded = true;
  bool isLoading = false;
  final TextEditingController controller = TextEditingController();
  var data;
  final url =
      "https://api.giphy.com/v1/gifs/search?api_key=oryeLVxeGtXfDPZCCIvUkWnL3391RnjX&limit=25&offset=0&rating=G&lang=en&q=";

  @override
  void initState() {
    super.initState();
  }

  getData(String searchInput) async {
    isLoading = true;
    setState(() {});
    var response = await http.get(url + searchInput);
    data = jsonDecode(response.body)["data"];
    print(data);
    setState(() {
      isLoading = false;
    });
  }

  loadNextData() {
    final initialIndex = data.length;
    final finalIndex = data.length + 10;
    print('load data from ${data.length}');

    Future.delayed(Duration(seconds: 3), () {
      for (var i = initialIndex; i < finalIndex; ++i) {
        data.add(i);
      }
      print('${data.length} data now');
      setState(() {});
    });
  }

  List<NavigationItem> items = [
    NavigationItem(
      icon: Icon(FontAwesomeIcons.bars),
      color: Colors.black54,
    ),
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
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: isSelected
            ? []
            : [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Colors.grey[600],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                ),
              ],
        gradient: isSelected
            ? LinearGradient(colors: [
                Colors.grey[900],
                Colors.grey[500],
                Colors.grey[400],
                Colors.grey[300],
                Colors.grey[100]
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
      ),
      child: IconTheme(
        data: IconThemeData(
          size: 22.0,
          color: isSelected ? item.color : Colors.black,
        ),
        child: item.icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Vx.gray800,
      body: SafeArea(
        child: Theme(
          data: ThemeData.dark(),
          child: Column(
            children: [
              // "Search Products".text.xl4.make().objectCenter(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: _isFolded ? 55 : 200,
                      height: 55,
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[8],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 16.0),
                              child: !_isFolded
                                  ? TextField(
                                      controller: controller,
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.black.withOpacity(0.6),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                          hintText: 'Search Products',
                                          hintStyle: TextStyle(
                                              color: Colors.blue[600],
                                              fontSize: 14.0),
                                          border: InputBorder.none),
                                      style: TextStyle(
                                        color: Colors.black,
                                        decorationColor: Colors.black,
                                      ),
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
                                  bottomLeft:
                                      Radius.circular(_isFolded ? 30 : 0),
                                  bottomRight: Radius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.widthBox,
                  RaisedButton(
                    onPressed: () {
                      getData(controller.text);
                    },
                    shape: Vx.roundedSm,
                    child: Text("Search"),
                  ).h4(context),
                ],
              ).p2(),
              SizedBox(
                height: 30.0,
              ),
              if (isLoading)
                CircularProgressIndicator().centered()
              else
                VxConditional(
                  condition: data != null,
                  builder: (context) => InfiniteGridView(
                    nextData: this.loadNextData(),
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 2.0),
                    itemBuilder: (context, index) {
                      final url = data[index]["images"]["fixed_height"]["url"]
                          .toString();
                      return Image.network(
                        url,
                        fit: BoxFit.cover,
                      ).card.roundedSM.make();
                    },
                  ),
                  fallback: (context) =>
                      "Nothing found".text.gray500.xl3.makeCentered(),
                ).h(context.percentHeight * 70),
            ],
          ).p12(),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
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
