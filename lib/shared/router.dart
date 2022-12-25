import 'package:go_router/go_router.dart';
import '../features/auth/auth.dart';
import '../features/waste/waste.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginWebView(),
    ),
    GoRoute(
      path: '/waste',
      builder: (context, state) => const WasteHomeScreen(),
    ),
  ],
);
