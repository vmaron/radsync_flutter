import 'package:flutter/foundation.dart';

import '../widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'patient_room_screen.dart';
import 'waste_screen.dart';
import 'inventory_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        if (kDebugMode) {
          print('Main tab index: ${_tabController.index}');
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radsync"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: const Text("WASTE", overflow: TextOverflow.ellipsis, maxLines: 1)),
            Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: const Text("PATIENT ROOM", overflow: TextOverflow.ellipsis, maxLines: 1)),
            Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: const Text("INVENTORY", overflow: TextOverflow.ellipsis, maxLines: 1)),
            const LogOutButton(),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [WasteScreen(), PatientRoomScreen(), InventoryScreen(), Tab(text: '')],
      ),
    );
  }
}
