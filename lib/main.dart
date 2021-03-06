import 'package:flutter/material.dart';
import 'package:flutter_demo_app/test_widget.dart';
import 'package:flutter_demo_app/wiki_search_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WikiSearchList(),
      // home: TestWidget(),
    );
  }
}
