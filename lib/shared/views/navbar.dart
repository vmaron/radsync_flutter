import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../providers/theme.dart';

class Navbar extends StatefulWidget {
  final int initialIndex;

  const Navbar({
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = 16;
    final iconColor =Theme.of(context).textTheme.bodyMedium?.color;

    return NavigationBar(
      onDestinationSelected: (int selectedIndex) {
        if (selectedIndex != _currentIndex) {
          switch (selectedIndex) {
            case 0:
              context.go('/waste');
              break;
            case 1:
              context.go('/patient-room');
              break;
          }
        }
        setState(() => _currentIndex = selectedIndex);
      },
      selectedIndex: _currentIndex,
      destinations: <Widget>[
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/archive-light.svg',
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
          label: 'Waste Requests',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/procedures-light.svg',
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
          label: 'Patient Room',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/clipboard-list-light.svg',
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
          label: 'Inventory',
        ),
      ],
    );
  }
}
