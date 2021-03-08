import 'package:dienstplan_app/widgets/custom_scaffold.dart';
import 'package:dienstplan_app/widgets/nachtdienst.dart';
import 'package:flutter/material.dart';

class NachtdienstScreen extends StatelessWidget {
  static const String routeName = '/nachtdienst';

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context).settings.arguments as String;
    return CustomScaffold(
      title: name,
      child: Nachtdienst(),
    );
  }
}
