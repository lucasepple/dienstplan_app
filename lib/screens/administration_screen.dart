import 'package:dienstplan_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class AdministrationScreen extends StatelessWidget {
  static const String routeName = '/administration';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      administration: true,
      title: 'Administration',
      child: Center(
        child: Text('Administration'),
      ),
    );
  }
}
