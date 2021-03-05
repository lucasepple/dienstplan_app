import 'package:dienstplan_app/screens/administration_screen.dart';
import 'package:dienstplan_app/screens/uebersicht_screen.dart';
import 'package:dienstplan_app/widgets/allgemein_side_bar.dart';

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final bool administration;

  CustomScaffold({
    this.administration = false,
    this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(title != null
            ? 'Puerto TWG Nachtdienstplan / $title'
            : 'Puerto TWG Nachtdienstplan'),
        actions: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  administration
                      ? UebersichtScreen.routeName
                      : AdministrationScreen.routeName,
                );
              },
              child: Text(
                administration ? 'Allgemein' : 'Administration',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => administration
            ? child
            : Row(
                children: [
                  AllgemeinSideBar(constraints),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
      ),
    );
  }
}
