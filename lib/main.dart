import 'package:flutter/material.dart';
import 'package:mirea_db_2/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dark Market',
      home: MyHomePage(),
    );
  } 
}
