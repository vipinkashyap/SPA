import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> _data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products on HomePage'),
      ),
      body: Container(
        child: _productsGridView(),
      ),
    );
  }

  loadNextData() {
    final initialIndex = _data.length;
    final finalIndex = _data.length + 10;
    print('load data from ${_data.length}');

    Future.delayed(Duration(seconds: 3), () {
      for (var i = initialIndex; i < finalIndex; ++i) {
        _data.add(i);
      }
      print('${_data.length} data now');
      setState(() {});
    });
  }

  Widget _productsGridView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InfiniteGridView(
        itemCount: _data.length,
        hasNext: _data.length < 200,
        nextData: this.loadNextData,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 10.0),
        itemBuilder: (BuildContext _context, int _index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              image: DecorationImage(
                image: NetworkImage("https://i.pravatar.cc/600?img=$_index"),
              ),
            ),
          );
        },
      ),
    );
  }
}
