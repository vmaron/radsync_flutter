import 'package:flutter/material.dart';

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

AppBarTheme appBarTheme(ColorScheme colors) {
  return AppBarTheme(
    elevation: 0,
    backgroundColor: colors.surface,
    foregroundColor: colors.onSurface,
  );
}

CardTheme cardTheme() {
  return CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    clipBehavior: Clip.antiAlias,
  );
}

ListTileThemeData listTileTheme(ColorScheme colors) {
  return ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    selectedColor: colors.secondary,
  );
}

BottomAppBarTheme bottomAppBarTheme(ColorScheme colors) {
  return BottomAppBarTheme(
    color: colors.surface,
    elevation: 0,
  );
}

BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
  return BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: colors.surfaceVariant,
    selectedItemColor: colors.onSurface,
    unselectedItemColor: colors.onSurfaceVariant,
    elevation: 0,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
  );
}

NavigationRailThemeData navigationRailTheme(ColorScheme colors) {
  return const NavigationRailThemeData();
}

TabBarTheme tabBarTheme(ColorScheme colors) {
  return TabBarTheme(
    labelColor: colors.secondary,
    unselectedLabelColor: colors.onSurfaceVariant,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: colors.secondary,
          width: 2,
        ),
      ),
    ),
  );
}

DrawerThemeData drawerTheme(ColorScheme colors) {
  return DrawerThemeData(
    backgroundColor: colors.surface,
  );
}
