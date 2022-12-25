import 'package:flutter/material.dart';
import 'package:radsync_flutter/shared/providers/theme.dart';
import 'router.dart';

class RadsyncApp extends StatefulWidget {
  const RadsyncApp({super.key});

  @override
  State<RadsyncApp> createState() => _RadsyncAppState();
}

class _RadsyncAppState extends State<RadsyncApp> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ThemeData.light().colorScheme;

    const pageTransitionsTheme = PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
        TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
        TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
      },
    );

    final theme = ThemeData.light().copyWith(
        pageTransitionsTheme: pageTransitionsTheme,
        colorScheme: colorScheme,
        appBarTheme: appBarTheme(colorScheme),
        cardTheme: cardTheme(),
        listTileTheme: listTileTheme(colorScheme),
        bottomAppBarTheme: bottomAppBarTheme(colorScheme),
        bottomNavigationBarTheme: bottomNavigationBarTheme(colorScheme),
        navigationRailTheme: navigationRailTheme(colorScheme),
        tabBarTheme: tabBarTheme(colorScheme),
        drawerTheme: drawerTheme(colorScheme),
        useMaterial3: true
      // scaffoldBackgroundColor: colorScheme.background,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Radsync',
      theme: theme,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider:
      appRouter.routeInformationProvider,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}