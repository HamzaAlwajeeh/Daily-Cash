import 'package:flutter/material.dart';

Future<String> getDate(BuildContext context) async {
  DateTime? date = await showDatePicker(
    context: context,
    currentDate: DateTime.now(),
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  return date.toString().split("-")[0];
}
