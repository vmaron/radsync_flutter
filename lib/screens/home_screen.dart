import '../widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'patient_room_screen.dart';
import 'waste_screen.dart';
import 'inventory_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text("Radsync"),
            bottom: TabBar(
              isScrollable: true,
              controller: tabController,
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
          body: const TabBarView(
            children: [WasteScreen(), PatientRoomScreen(), InventoryScreen(), Tab(text: '')],
          ),
        );
      }),
    );
  }
}
