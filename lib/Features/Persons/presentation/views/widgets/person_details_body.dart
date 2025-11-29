import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_person_pdf_cubit/get_person_pdf_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/views/pdf_viewer.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/dialog_message.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:daily_cash/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PersonDetailsBody extends StatefulWidget {
  const PersonDetailsBody({super.key, required this.person});
  final Person person;

  @override
  State<PersonDetailsBody> createState() => _PersonDetailsBodyState();
}

class _PersonDetailsBodyState extends State<PersonDetailsBody> {
  @override
  void initState() {
    BlocProvider.of<GetPersonPdfCubit>(
      context,
    ).getPersonPdf(id: widget.person.id);
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
          Expanded(
            child: PdfViewer(
              pdfUrl: BlocProvider.of<GetPersonPdfCubit>(context).personUrl,
            ),
          ),
          // PersonDetailsSummary(),
          PrimaryButton(
            text: 'كشف حساب',
            hasIcon: true,
            onPressed: () async {
              await downloadPdfWithDio(2);
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
