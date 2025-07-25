import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodieland/navigation/app_wrapper.dart';
import 'package:foodieland/screens/about_us_screen.dart';
import 'package:foodieland/screens/blog_screen/blog_screen.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_screen.dart';
import 'package:foodieland/screens/recipes_screen/recipes_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/contact_screen.dart';
import '../screens/home_screen/home_screen.dart';

part 'routes.g.dart';

@TypedStatefulShellRoute<HomeShellRoute>(
  branches: <TypedStatefulShellBranch>[
    TypedStatefulShellBranch(
      routes: <TypedRoute>[
        TypedGoRoute<HomeScreenRoute>(path: '/home'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<RecipesScreenRoute>(
          path: '/recipes',
          routes: [
            TypedGoRoute<RecipeDetailRoute>(path: 'recipe/:id'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: <TypedRoute>[
        TypedGoRoute<BlogScreenRoute>(path: '/blog'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: <TypedRoute>[
        TypedGoRoute<ContactScreenRoute>(path: '/contact'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: <TypedRoute>[
        TypedGoRoute<AboutUsScreenRoute>(path: '/about-us'),
      ],
    ),
  ],
)
class HomeShellRoute extends StatefulShellRouteData {
  const HomeShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return AppWrapper(navigationShell: navigationShell);
  }
}


@TypedGoRoute<HomeScreenRoute>(path: '/home')
class HomeScreenRoute extends GoRouteData with _$HomeScreenRoute{
  const HomeScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>  HomeScreen();
}

@TypedGoRoute<RecipesScreenRoute>(path: '/recipes',)
class RecipesScreenRoute extends GoRouteData with _$RecipesScreenRoute{
  const RecipesScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RecipesScreen();
}

@TypedGoRoute<BlogScreenRoute>(path: '/blog')
class BlogScreenRoute extends GoRouteData with _$BlogScreenRoute{
  const BlogScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const BlogScreen();
}

@TypedGoRoute<ContactScreenRoute>(path: '/contact')
class ContactScreenRoute extends GoRouteData with _$ContactScreenRoute{
  const ContactScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ContactScreen();
}

@TypedGoRoute<AboutUsScreenRoute>(path: '/about-us')
class AboutUsScreenRoute extends GoRouteData with _$AboutUsScreenRoute{
  const AboutUsScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AboutUsScreen();
}

class RecipeDetailRoute extends GoRouteData with _$RecipeDetailRoute {
  const RecipeDetailRoute({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: RecipeDetailsScreen(recipeId: id),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
    );
  }
}





