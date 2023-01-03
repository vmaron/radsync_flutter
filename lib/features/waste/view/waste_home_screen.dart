import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';
import 'package:radsync_flutter/models/waste/request.dart';
import 'package:radsync_flutter/shared/views/views.dart';
import 'package:radsync_flutter/models/waste/filter.dart';
import 'package:radsync_flutter/models/constants.dart';
import 'package:radsync_flutter/shared/waste/bloc/bloc.dart';

class Tab {
  final String name;
  final String title;

  Tab(this.name, this.title);
}

final tabs = [
  Tab('Pending', 'Pending Requests'),
  Tab('My Requests', 'My Requests'),
  Tab('Submit Request', 'Submit Request'),
  Tab('Completed', 'Completed Requests'),
];

class WasteHomeScreen extends StatefulWidget {
  const WasteHomeScreen({super.key});

  @override
  State<WasteHomeScreen> createState() => _WasteHomeScreenState();
}

class _WasteHomeScreenState extends State<WasteHomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late WasteSearchBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<WasteSearchBloc>();

    _bloc.add(
      WasteSearchEvent(filter: WasteRequestFilter(pageNumber: 1, pageSize: 20)),
    );

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
    return BlocBuilder<WasteSearchBloc, WasteSearchState>(
      builder: (context, state) {
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
                        overflow: TextOverflow.ellipsis, maxLines: 1, style: const TextStyle(fontSize: 12)));
              }).toList(),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: tabs.asMap().entries.map((entry) {
              int idx = entry.key;
              Tab tab = entry.value;
              if (idx == 0) {
                switch (state.status) {
                  case FetchStatus.initial:
                    return const Empty();
                  case FetchStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case FetchStatus.success:
                    return Stack(
                      children: <Widget>[
                       /* ClipPath(
                          clipper: WaveClipperTwo(),
                          child: Container(
                            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                            height: 200,
                          ),
                        ),*/
                        ListView.separated(
                          itemCount: state.items.length,
                          separatorBuilder: (context, index) => Divider(
                            color: Theme.of(context).listTileTheme.textColor,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.items[index];
                            return _buildItem(item);
                          },
                        )
                      ],
                    );
                  case FetchStatus.failure:
                    return Empty(title: state.error);
                }
              }
              return Empty(title: tab.title);
            }).toList(),
          ),
          bottomNavigationBar: const Navbar(initialIndex: 0),
        );
      },
    );
  }

  Card _buildItem(WasteRequest item) {
    var dateFormat = DateFormat('MM/dd/yyyy');
    return Card(
      elevation: Theme.of(context).cardTheme.elevation,
      color: Theme.of(context).cardTheme.color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item.createdByName ?? ''),
            const SizedBox(height: 5.0),
            Text(dateFormat.format(item.createdTime!)),
            const SizedBox(height: 5.0),
            Text(item.buildingName ?? ''),
          ],
        ),
      ),
    );
  }
}
