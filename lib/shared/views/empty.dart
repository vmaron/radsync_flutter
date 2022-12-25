import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, style: Theme.of(context).textTheme.headline5));
  }
}
