import 'package:foodieland/navigation/routes.dart';
import 'package:go_router/go_router.dart';

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
