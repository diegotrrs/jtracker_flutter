
import 'dart:async';
import 'dart:convert';
import 'Test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Test> fetchTest() async {
  final response =
  await http.get('https://us-central1-jtrackerj.cloudfunctions.net/api/test');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return Test.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<Post> fetchPost() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                print('results');
                print(snapshot.data);
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}