// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $homeShellRoute,
  $homeScreenRoute,
  $recipesScreenRoute,
  $blogScreenRoute,
  $contactScreenRoute,
  $aboutUsScreenRoute,
];

RouteBase get $homeShellRoute => StatefulShellRouteData.$route(
  factory: $HomeShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',

          factory: _$HomeScreenRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/recipes',

          factory: _$RecipesScreenRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'recipe/:id',

              factory: _$RecipeDetailRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/blog',

          factory: _$BlogScreenRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'post/:id',

              factory: _$PostDetailsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/contact',

          factory: _$ContactScreenRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/about-us',

          factory: _$AboutUsScreenRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) =>
      const HomeShellRoute();
}

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

mixin _$RecipeDetailRoute on GoRouteData {
  static RecipeDetailRoute _fromState(GoRouterState state) =>
      RecipeDetailRoute(id: state.pathParameters['id']!);

  RecipeDetailRoute get _self => this as RecipeDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/recipes/recipe/${Uri.encodeComponent(_self.id)}');

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

mixin _$PostDetailsRoute on GoRouteData {
  static PostDetailsRoute _fromState(GoRouterState state) =>
      PostDetailsRoute(id: state.pathParameters['id']!);

  PostDetailsRoute get _self => this as PostDetailsRoute;

  @override
  String get location =>
      GoRouteData.$location('/blog/post/${Uri.encodeComponent(_self.id)}');

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

RouteBase get $homeScreenRoute =>
    GoRouteData.$route(path: '/home', factory: _$HomeScreenRoute._fromState);

RouteBase get $recipesScreenRoute => GoRouteData.$route(
  path: '/recipes',

  factory: _$RecipesScreenRoute._fromState,
);

RouteBase get $blogScreenRoute =>
    GoRouteData.$route(path: '/blog', factory: _$BlogScreenRoute._fromState);

RouteBase get $contactScreenRoute => GoRouteData.$route(
  path: '/contact',

  factory: _$ContactScreenRoute._fromState,
);

RouteBase get $aboutUsScreenRoute => GoRouteData.$route(
  path: '/about-us',

  factory: _$AboutUsScreenRoute._fromState,
);
