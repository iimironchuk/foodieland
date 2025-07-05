// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $homeScreenRoute,
  $recipesScreenRoute,
  $blogScreenRoute,
  $contactScreenRoute,
  $aboutUsScreenRoute,
];

RouteBase get $homeScreenRoute =>
    GoRouteData.$route(path: '/home', factory: _$HomeScreenRoute._fromState);

mixin _$HomeScreenRoute on GoRouteData {
  static HomeScreenRoute _fromState(GoRouterState state) =>
      const HomeScreenRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $recipesScreenRoute => GoRouteData.$route(
  path: '/recipes',

  factory: _$RecipesScreenRoute._fromState,
);

mixin _$RecipesScreenRoute on GoRouteData {
  static RecipesScreenRoute _fromState(GoRouterState state) =>
      const RecipesScreenRoute();

  @override
  String get location => GoRouteData.$location('/recipes');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $blogScreenRoute =>
    GoRouteData.$route(path: '/blog', factory: _$BlogScreenRoute._fromState);

mixin _$BlogScreenRoute on GoRouteData {
  static BlogScreenRoute _fromState(GoRouterState state) =>
      const BlogScreenRoute();

  @override
  String get location => GoRouteData.$location('/blog');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $contactScreenRoute => GoRouteData.$route(
  path: '/contact',

  factory: _$ContactScreenRoute._fromState,
);

mixin _$ContactScreenRoute on GoRouteData {
  static ContactScreenRoute _fromState(GoRouterState state) =>
      const ContactScreenRoute();

  @override
  String get location => GoRouteData.$location('/contact');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $aboutUsScreenRoute => GoRouteData.$route(
  path: '/about-us',

  factory: _$AboutUsScreenRoute._fromState,
);

mixin _$AboutUsScreenRoute on GoRouteData {
  static AboutUsScreenRoute _fromState(GoRouterState state) =>
      const AboutUsScreenRoute();

  @override
  String get location => GoRouteData.$location('/about-us');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
