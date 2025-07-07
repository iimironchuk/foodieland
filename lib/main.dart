import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/navigation/app_router.dart';
import 'package:foodieland/resources/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  AppRouter().initializeRouter();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child){
        child = BotToastInit()(context, child);
        return child;
      },
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}

