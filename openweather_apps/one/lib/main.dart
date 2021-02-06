import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'model.dart';

void main() => runApp(MyApp());

final String apiKey = 'bcfea739e77ce1932823f78987515383';
final String weatherUrl =
    'https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689'
    '&exclude=hourly,minutely,alerts&appid=$apiKey&units=metric';
dynamic jsonString;

final oneCallWeather = oneCallWeatherFromJson(jsonString);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App One',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //We need to make a http request and save the response for display in the UI
//First we will need to write a function to get the response from URL
  Future<Response> getData() async {
    return await http.get(weatherUrl);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App One'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('Data exists....');
              jsonString = jsonDecode(snapshot.data.body);
              var historicalData = jsonString['daily'];
              return ListView.builder(
                  itemCount: historicalData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${historicalData[index]['temp']['min']}"),
                      title: Text(
                          "${DateTime.fromMillisecondsSinceEpoch(historicalData[index]['dt'] * 1000)}"),
                      trailing: Text("${historicalData[index]['temp']['max']}"),
                    );
                  });
            } else if (snapshot.hasError) {
              return AlertDialog(title: Text('${snapshot.error}'));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
