import 'package:go_router/go_router.dart';
import '../features/auth/auth.dart';
import '../features/waste/waste.dart';
import '../features/patient_room/patient_room.dart';
import '../features/inventory/inventory.dart';


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
    GoRoute(
      path: '/patient-room',
      builder: (context, state) => const PatientRoomHomeScreen(),
    ),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => const DecayQueue(),
    ),
  ],
);
