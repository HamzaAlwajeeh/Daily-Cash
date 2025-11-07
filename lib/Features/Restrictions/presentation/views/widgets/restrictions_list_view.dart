import 'package:daily_cash/Features/Restrictions/data/models/restrictions_model.dart';
import 'package:daily_cash/Features/Restrictions/data/restrictions_data.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/restrictions_view_body.dart';
import 'package:flutter/material.dart';

class RestrictionsListView extends StatefulWidget {
  const RestrictionsListView({super.key});

  @override
  State<RestrictionsListView> createState() => _RestrictionsListViewState();
}

class _RestrictionsListViewState extends State<RestrictionsListView> {
  List<RestrictionsModel> restrictions = [];
  @override
  void initState() {
    restrictions = getRestrictions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: restrictions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: RestrictionsItem(restrictions: restrictions[index]),
        );
      },
    );
  }
}
