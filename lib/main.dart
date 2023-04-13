import 'package:flutter/material.dart';
import 'package:flutter30daychallange/pages/animation/animanted_widget_example.dart';
import 'package:flutter30daychallange/pages/animation/animated_builder_example.dart';
import 'package:flutter30daychallange/pages/animation/animation2/animated_drawer_home.dart';
import 'package:flutter30daychallange/pages/animation/animation2/simple_drawer_home.dart';
import 'package:flutter30daychallange/pages/animation/simple_basic_animatin.dart';
import 'package:flutter30daychallange/pages/youtube/youtube_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SimpleBasicAnimation());
  }
}
