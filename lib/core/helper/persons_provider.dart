import 'dart:developer';

import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:flutter/material.dart';

class PersonsProvider extends ChangeNotifier {
  PersonModel? _selectedPerson;
  PersonModel? _fromPerson;
  PersonModel? _toPerson;
  String? type;

  PersonModel? get selectedPerson => _selectedPerson;

  PersonModel? get fromPerson => _fromPerson;

  PersonModel? get toPerson => _toPerson;

  void selectPerson(PersonModel? person) {
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
