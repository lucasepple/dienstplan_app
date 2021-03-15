import 'package:dienstplan_app/providers/nachtdienste.dart';
import 'package:dienstplan_app/screens/administration_screen.dart';
import 'package:dienstplan_app/screens/nachtdienst_screen.dart';
import 'package:dienstplan_app/screens/uebersicht_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DienstplanApp());
}

class DienstplanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Nachtdienste(),
      child: MaterialApp(
        title: 'Puerto TWG Nachtdienstplan',
        theme: ThemeData(
          primaryColor: Color(0xff192B4D),
          accentColor: Color(0xff93ABDC),
        ),
        debugShowCheckedModeBanner: false,
        home: UebersichtScreen(),
        routes: {
          UebersichtScreen.routeName: (context) => UebersichtScreen(),
          NachtdienstScreen.routeName: (context) => NachtdienstScreen(),
          AdministrationScreen.routeName: (context) => AdministrationScreen(),
        },
      ),
    );
  }
}
