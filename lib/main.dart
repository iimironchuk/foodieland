import 'package:flutter/material.dart';
import 'package:foodieland/app_wrapper.dart';
import 'package:foodieland/di/service_locator.dart';
import 'package:foodieland/resources/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/home_screen/home_screen.dart';

void main() async {
  await ServiceLocator().setupLocator();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      home: const HomeScreen(),
    );
  }
}

