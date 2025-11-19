import 'package:flutter/material.dart';

Future<String> getDate(BuildContext context) async {
  DateTime? date = await showDatePicker(
    context: context,
    currentDate: DateTime.now(),
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  date == null ? date = DateTime.now() : date = date;
  return {
    "year": date.year,
    "month": date.month,
    "day": date.day,
  }.values.join('-');
}
