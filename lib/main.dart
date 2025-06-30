import 'package:flutter/material.dart';
import 'package:foodieland/app_wrapper.dart';
import 'package:foodieland/resources/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      home: const AppWrapper(child: Text('text'),),
    );
  }
}

