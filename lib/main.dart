import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/navigation/app_router.dart';
import 'package:foodieland/resources/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferencesPlugin.registerWith(null);
  AppRouter().initializeRouter();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints(
      breakpoints: [
        const Breakpoint(start: 0, end: 480, name: MOBILE),
        const Breakpoint(start: 481, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1280, name: 'Laptop'),
        const Breakpoint(start: 1281, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: MaterialApp.router(
        builder: (context, child){
          child = BotToastInit()(context, child);
          return child;
        },
        title: 'Flutter Demo',
        theme: AppTheme.themeData,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
    );
  }
}

