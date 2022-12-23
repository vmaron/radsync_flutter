import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../modules/api/auth_service.dart';
import '../modules/tools/navigate.dart';
import 'login_web_view.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Waste'),
  Tab(text: 'Patient Room'),
  Tab(text: 'Inventory'),
  Tab(text: '')
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
                    height: 50,
                    alignment: Alignment.center, padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: const Text("WASTE", overflow: TextOverflow.ellipsis, maxLines: 1)),
                Container(
                    height: 50,
                    alignment: Alignment.center, padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: const Text("PATIENT ROOM", overflow: TextOverflow.ellipsis, maxLines: 1)),
                Container(
                    height: 50,
                    alignment: Alignment.center, padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: const Text("INVENTORY", overflow: TextOverflow.ellipsis, maxLines: 1)),
                Container(
                  height: 50,
                  alignment: Alignment.center, padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: IconButton(
                    onPressed: () {
                      final authService = AuthService();
                      authService.logout();
                      Navigate.push(context, LoginWebView(controller: Completer<WebViewController>()));
                    },
                    icon: const Icon(Icons.account_circle_sharp),
                  ),
                ),
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
