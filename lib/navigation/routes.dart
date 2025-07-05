import 'package:flutter/material.dart';
import 'package:foodieland/screens/about_us_screen.dart';
import 'package:foodieland/screens/blog_screen.dart';
import 'package:foodieland/screens/recipes_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/contact_screen.dart';
import '../screens/home_screen/home_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(path: '/home')
class HomeScreenRoute extends GoRouteData with _$HomeScreenRoute{
  const HomeScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<RecipesScreenRoute>(path: '/recipes')
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
