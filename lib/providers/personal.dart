import 'package:flutter/material.dart';

class Personal {
  final String name;
  final int schichten;
  List<int> schichtenWunsh = [0, 0, 0];
  List<int> schichtenMax = [0, 0, 0];
  List<List<int>> daten = [[], [], []];

  Personal({
    @required this.name,
    @required this.schichten,
  });
}
