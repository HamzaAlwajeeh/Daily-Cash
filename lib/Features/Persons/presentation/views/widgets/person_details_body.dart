import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/person_details_list_view.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/person_details_summary.dart';
import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/dialog_message.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonDetailsBody extends StatefulWidget {
  const PersonDetailsBody({super.key, required this.person});
  final Person person;

  @override
  State<PersonDetailsBody> createState() => _PersonDetailsBodyState();
}

class _PersonDetailsBodyState extends State<PersonDetailsBody> {
  List<Operation> operations = [];

  @override
  void initState() {
    operations = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: Column(
        spacing: 16,
        children: [
          CustomAppBar(title: widget.person.name),
          Expanded(child: PersonDetailsListView(operations: operations)),
          PersonDetailsSummary(),
          PrimaryButton(
            text: 'كشف حساب',
            hasIcon: true,
            onPressed: () {
              dialogMessage(
                context: context,
                message: 'تم التحميل بنجاح',
                okText: 'رجوع',
                icon: SvgPicture.asset(Assets.imagesDownloadSuccess),
                cancleText: '',
                onClickOk: () {
                  Navigator.pop(context);
                },
                buttonsCount: 1,
              );
            },
          ),
        ],
      ),
    );
  }
}
