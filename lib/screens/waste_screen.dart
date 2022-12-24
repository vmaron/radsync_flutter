import 'package:flutter/material.dart';

class WasteScreen extends StatelessWidget {
  const WasteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Waste Tab',
      style: Theme.of(context).textTheme.headline5,
    ));
  }
}
