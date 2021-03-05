import 'package:dienstplan_app/widgets/custom_scaffold.dart';
import 'package:dienstplan_app/widgets/allgemein_side_bar.dart';
import 'package:dienstplan_app/widgets/nachtdienst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UebersichtScreen extends StatelessWidget {
  static const String routeName = '/uebersicht';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Center(
        child: Text('Übersicht'),
      ),
    );
  }
}
