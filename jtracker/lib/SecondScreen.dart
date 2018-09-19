
import 'dart:async';
import 'dart:convert';
import 'Test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ThirdScreen.dart';
import 'ThirdScreenList.dart';

class SecondScreen extends StatelessWidget {

  Future<Test> fetchPost() async {
    final response =
    await http.get('https://us-central1-jtrackerj.cloudfunctions.net/api');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Test.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget button = RaisedButton(
      child: Text('3rd screen version 1'),
      color: Colors.red,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThirdScreen()),
        );
      },
    );

    Widget button2 = RaisedButton(
      child: Text('3rd screen version 2 xxx'),
      color: Colors.red,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThirdScreenList()),
        );
      },
    );

    Widget topSection = Container(
        margin: const EdgeInsets.all(20.0), child: button);


    Widget topSection2 = Container(
        margin: const EdgeInsets.all(20.0), child: button2);


    Widget bottomSection = Container(
      margin: const EdgeInsets.all(20.0),
      color: Colors.blue,
      child: Text(
        "Holammm",
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: Colors.orange,
        ),
      ),
    );

    ListView listView = ListView(
      children: [
        topSection,// topSection,
        topSection2,
        bottomSection,
      ],
    );

    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: listView);
  }
}