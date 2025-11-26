import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/restrictions_item.dart';
import 'package:flutter/material.dart';

class RestrictionsListView extends StatelessWidget {
  const RestrictionsListView({super.key, required this.restrictions});
  final List<Restriction> restrictions;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: restrictions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: RestrictionsItem(restriction: restrictions[index]),
        );
      },
    );
  }
}
