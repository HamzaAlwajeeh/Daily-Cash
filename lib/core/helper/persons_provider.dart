import 'dart:developer';

import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:flutter/material.dart';

class PersonsProvider extends ChangeNotifier {
  Person? _selectedPerson;
  Person? _fromPerson;
  Person? _toPerson;
  String? type;

  Person? get selectedPerson => _selectedPerson;

  Person? get fromPerson => _fromPerson;

  Person? get toPerson => _toPerson;

  void selectPerson(Person? person) {
    _selectedPerson = person;
    type == 'from' ? _fromPerson = person : _toPerson = person;
    log(type.toString());
    notifyListeners();
  }

  void clearSelectedPerson() {
    _selectedPerson = null;
    _fromPerson = null;
    _toPerson = null;
    notifyListeners();
  }
}
