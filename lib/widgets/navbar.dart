import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatefulWidget {
  const Navbar({
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
    _currentIndex = 0;
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
        debugPrint("Bottom Navigation Bar onTap: $selectedIndex");
        setState(() {
          _currentIndex = selectedIndex;
        });
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
