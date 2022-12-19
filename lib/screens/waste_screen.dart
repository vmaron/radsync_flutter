import 'package:flutter/material.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Waste'),
  Tab(text: 'Patient Room'),
  Tab(text: 'Inventory'),
];

class WasteScreen extends StatelessWidget {
  const WasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
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
              tabs: <Widget>[
                Container(
                    width: 80,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text("WASTE")),
                Container(
                    width: 120,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text("PATIENT ROOM")),
                Container(
                    width: 80,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text("INVENTORY"))
              ],
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
