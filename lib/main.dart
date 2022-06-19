import 'package:flutter/material.dart';
import 'package:news/screens/loading_screen.dart';
import 'package:news/screens/home_page.dart';
import 'package:news/screens/detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingScreen(),
    );
  }
}
