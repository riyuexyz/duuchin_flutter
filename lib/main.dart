import 'package:duuchin_flutter/config/app_theme.dart';
import 'package:duuchin_flutter/transit_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '读琴',
      theme: themeData,
      home: const TransitPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}