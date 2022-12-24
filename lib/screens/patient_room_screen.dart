import 'package:flutter/material.dart';

class PatientRoomScreen extends StatelessWidget {
  const PatientRoomScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Patient Room',
      style: Theme.of(context).textTheme.headline5,
    ));
  }
}
