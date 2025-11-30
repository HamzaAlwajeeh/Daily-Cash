import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_person_pdf_cubit/get_person_pdf_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_person_pdf_cubit/get_person_pdf_state.dart';
import 'package:daily_cash/Features/Persons/presentation/views/pdf_viewer.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/helper/download_files.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/dialog_message.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
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
    return BlocBuilder<GetPersonPdfCubit, GetPersonPdfState>(
      builder: (context, state) {
        String url = BlocProvider.of<GetPersonPdfCubit>(context).personUrl;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            spacing: 16,
            children: [
              CustomAppBar(title: widget.person.name),
              Expanded(
                child:
                    state is GetPersonPdfLoading
                        ? CustomLoadingIndicator()
                        : state is GetPersonPdfFailure
                        ? Center(child: Text(state.errorMessage))
                        : PdfViewer(pdfUrl: url),
              ),
              // PersonDetailsSummary(),
              PrimaryButton(
                text: 'تحميل الملف',
                hasIcon: true,
                onPressed: () async {
                  await downloadAnyFile(url: url);
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
      },
    );
  }
}
