import 'package:flutter/cupertino.dart';
import 'package:foodieland/navigation/routes.dart';
import 'package:foodieland/screens/about_us_screen.dart';
import 'package:foodieland/screens/blog_screen.dart';
import 'package:foodieland/screens/contact_screen.dart';
import 'package:foodieland/screens/recipes_screen/recipes_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen/home_screen.dart';
import 'app_wrapper.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() => _instance;

  AppRouter._internal();

  static late final GoRouter router;

  Future<void> initializeRouter() async {
    final initialRoute = HomeScreenRoute().location;

    router = GoRouter(initialLocation: initialRoute, routes: $appRoutes);

  }
}
