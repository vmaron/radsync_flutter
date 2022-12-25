import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatefulWidget {
  final int initialIndex;

  const Navbar({
    required this.initialIndex, Key? key,
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
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 12,
      iconSize: 22,
      currentIndex: _currentIndex,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, height: 2),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, height: 2),
      selectedItemColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (selectedIndex) {
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
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.boxArchive,
          ),
          label: 'Waste Requests',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bedPulse),
          label: 'Patient Room',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.clipboardList),
          label: 'Inventory',
        )
      ],
    );
  }
}
