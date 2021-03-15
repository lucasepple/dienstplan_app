import 'dart:convert';

import 'package:dienstplan_app/providers/personal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Nachtdienste extends ChangeNotifier {
  List<Personal> _nachtdienste = [
    Personal(
      name: 'Daniela Prychodzen',
      schichten: 0,
    ),
    Personal(
      name: 'Karl-Andy Simon',
      schichten: 2,
    ),
    Personal(
      name: 'Daniela Pockrandt',
      schichten: 2,
    ),
    Personal(
      name: 'Luca Wollenberg',
      schichten: 0,
    ),
  ];

  List<Personal> get nachtdienste {
    return [..._nachtdienste];
  }

  Future<void> addPersonal(Personal personal) async {
    Uri url = Uri.https(
      'nachtdienstplan-6cfb5-default-rtdb.firebaseio.com',
      '/personal.json',
    );
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'name': personal.name,
            'schichten': personal.schichten,
          },
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  void plusWunsch(String name, int index) {
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenWunsh[index]++;
    notifyListeners();
  }

  void plusMax(String name, int index) {
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenMax[index]++;
    notifyListeners();
  }

  void plusBeide(String name, int index) {
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenWunsh[index]++;
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenMax[index]++;
    notifyListeners();
  }

  void minusWunsch(String name, int index) {
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenWunsh[index]--;
    notifyListeners();
  }

  void minusMax(String name, int index) {
    notifyListeners();
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenMax[index]--;
  }

  void minusBeide(String name, int index) {
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenWunsh[index]--;
    _nachtdienste
        .firstWhere((personal) => personal.name == name)
        .schichtenMax[index]--;
    notifyListeners();
  }

  Personal findByName(String name) {
    return _nachtdienste.firstWhere((personal) => personal.name == name);
  }
}
