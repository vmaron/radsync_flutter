import 'dart:async';
import 'package:flutter/material.dart';
import 'package:radsync_flutter/shared/providers/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'features/auth/auth.dart';

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
      theme: ThemeData(/*fontFamily: "Montserrat"*/).copyWith(
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
