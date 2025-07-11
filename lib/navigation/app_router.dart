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

  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _rootNavigationHome = GlobalKey<NavigatorState>(
    debugLabel: 'shellHome',
  );
  static final _rootNavigationRecipes = GlobalKey<NavigatorState>(
    debugLabel: 'shellRecipes',
  );
  static final _rootNavigationBlog = GlobalKey<NavigatorState>(
    debugLabel: 'shellBlog',
  );
  static final _rootNavigationContacts = GlobalKey<NavigatorState>(
    debugLabel: 'shellContacts',
  );
  static final _rootNavigationAboutUs = GlobalKey<NavigatorState>(
    debugLabel: 'shellAboutUs',
  );

  static late final GoRouter router;

  Future<void> initializeRouter() async {
    final initialRoute = HomeScreenRoute().location;

    router = GoRouter(
      initialLocation: initialRoute,
      navigatorKey: _rootNavigationKey,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return AppWrapper(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _rootNavigationHome,
              routes: [
                GoRoute(
                  path: HomeScreenRoute().location,
                  builder: (context, state) {
                    return HomeScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigationRecipes,
              routes: [
                GoRoute(
                  path: RecipesScreenRoute().location,
                  builder: (context, state) {
                    return RecipesScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigationBlog,
              routes: [
                GoRoute(
                  path: BlogScreenRoute().location,
                  builder: (context, state) {
                    return BlogScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigationContacts,
              routes: [
                GoRoute(
                  path: ContactScreenRoute().location,
                  builder: (context, state) {
                    return ContactScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigationAboutUs,
              routes: [
                GoRoute(
                  path: AboutUsScreenRoute().location,
                  builder: (context, state) {
                    return AboutUsScreen();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
