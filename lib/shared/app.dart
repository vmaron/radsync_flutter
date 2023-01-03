import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radsync_flutter/modules/api/waste_request_service.dart';
import 'package:radsync_flutter/shared/providers/theme.dart';
import 'package:radsync_flutter/shared/waste/bloc/bloc.dart';
import 'router.dart';

class RadsyncApp extends StatefulWidget {
  const RadsyncApp({super.key});

  @override
  State<RadsyncApp> createState() => _RadsyncAppState();
}

class _RadsyncAppState extends State<RadsyncApp> {
  @override
  Widget build(BuildContext context) {
    final settings = ValueNotifier(ThemeSettings(
      lightThemeColor: Colors.indigo,
      darkThemeColor: ThemeData.dark().primaryColor,
      themeMode: ThemeMode.system,
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider<WasteSearchBloc>(
          create: (context) => WasteSearchBloc(WasteRequestService()),
        ),
      ],
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
            lightDynamic: lightDynamic,
            darkDynamic: darkDynamic,
            settings: settings,
            child: NotificationListener<ThemeSettingChange>(
              onNotification: (notification) {
                settings.value = notification.settings;
                return true;
              },
              child: ValueListenableBuilder<ThemeSettings>(
                valueListenable: settings,
                builder: (context, value, _) {
                  final theme = ThemeProvider.of(context);
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: 'Radsync',
                    theme: theme.light(settings.value.lightThemeColor),
                    darkTheme: theme.dark(settings.value.darkThemeColor),
                    themeMode: theme.themeMode(),
                    routeInformationParser: appRouter.routeInformationParser,
                    routeInformationProvider: appRouter.routeInformationProvider,
                    routerDelegate: appRouter.routerDelegate,
                  );
                },
              ),
            )),
      ),
    );
  }
}
