import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radsync_flutter/modules/api/waste_request_service.dart';
import 'package:radsync_flutter/shared/views/views.dart';

import '../../../models/waste/filter.dart';
import '../../../models/waste/request.dart';

class Tab {
  final String name;
  final String title;

  Tab(this.name, this.title);
}

final tabs = [
  Tab('Submit Request', 'Submit Request'),
  Tab('My Requests', 'My Requests'),
  Tab('Pending', 'Pending Requests'),
  Tab('Completed', 'Completed Requests'),
];

class WasteHomeScreen extends StatefulWidget {
  const WasteHomeScreen({super.key});

  @override
  State<WasteHomeScreen> createState() => _WasteHomeScreenState();
}

class _WasteHomeScreenState extends State<WasteHomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
    final service = WasteRequestService();
    WasteRequestFilter filter = WasteRequestFilter(pageNumber: 1, pageSize: 20);

    return FutureBuilder<WasteRequestResponse>(
        future: service.getPendingRequests(filter),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WasteRequestResponse? response = snapshot.data;
            if (kDebugMode) {
              print('Total count: ${response?.totalCount}');
              // print(response?.data);
            }

            return Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Radsync"),
                    LogOutButton(),
                  ],
                ),
                bottom: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: tabs.map((Tab tab) {
                    return Container(
                        height: 50,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                        child: Text(tab.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 12)));
                  }).toList(),
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: tabs.map((Tab tab) => Empty(title: tab.title)).toList(),
              ),
              bottomNavigationBar: const Navbar(initialIndex: 0),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error} occurred");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
