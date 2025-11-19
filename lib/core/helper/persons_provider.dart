import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:flutter/material.dart';

class PersonsProvider extends ChangeNotifier {
  PersonModel? _selectedPerson;

  PersonModel? get selectedPerson => _selectedPerson;

  void selectPerson(PersonModel? person) {
    _selectedPerson = person;
    notifyListeners();
  }

  void clearSelectedPerson() {
    _selectedPerson = null;
    notifyListeners();
  }
}
