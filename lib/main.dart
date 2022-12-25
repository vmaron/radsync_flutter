import 'dart:async';
import 'package:flutter/material.dart';
import 'package:radsync_flutter/screens/login_web_view.dart';
import 'package:radsync_flutter/shared/providers/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  const NoAnimationPageTransitionsBuilder();
  const pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  final colorScheme = ThemeData.light().colorScheme;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
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
        scaffoldBackgroundColor: colorScheme.background,
        useMaterial3: true,
      ),
      home: const RadsyncApp(),
    ),
  );
}

class RadsyncApp extends StatefulWidget {
  const RadsyncApp({super.key});

  @override
  State<RadsyncApp> createState() => _RadsyncAppState();
}

class _RadsyncAppState extends State<RadsyncApp> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWebView(controller: controller),
    );
  }
}
