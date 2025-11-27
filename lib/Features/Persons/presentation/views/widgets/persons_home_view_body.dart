import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/delete_person_cubit/delete_person_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/delete_person_cubit/delete_person_state.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_state.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/persons_list_view.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/helper/no_search_found_message.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonsHomeViewBody extends StatefulWidget {
  const PersonsHomeViewBody({super.key});

  @override
  State<PersonsHomeViewBody> createState() => _PersonsHomeViewBodyState();
}

class _PersonsHomeViewBodyState extends State<PersonsHomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetAllPersonsCubit>(context).getAllPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeletePersonCubit, DeletePersonState>(
      listener: (context, state) {
        if (state is DeletePersonSuccess) {
          context.read<GetAllPersonsCubit>().getAllPersons();
          customToastBar(
            context: context,
            message: 'تم الحذف بنجاح',
            icon: Icons.check,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<GetAllPersonsCubit, GetAllPersonsState>(
          builder: (context, state) {
            List<Person> persons =
                BlocProvider.of<GetAllPersonsCubit>(context).personsList;
            return Padding(
              padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('المشاريع والعمال', style: TextStyles.bold20),
                  CustomTextFeild(
                    onChanged: (value) {
                      BlocProvider.of<GetAllPersonsCubit>(
                        context,
                      ).searchPerson(value);
                    },
                    hintText: 'البحث بالإسم...',
                    suffixIcon: Assets.imagesFilter,
                  ),
                  Expanded(
                    child: Builder(
                      builder: (_) {
                        if (state is GetAllPersonsLoading) {
                          return const CustomLoadingIndicator();
                        }

                        if (state is GetAllPersonsFailure) {
                          return const NotSearchFoundMessage(
                            message: 'حدث خطأ أثناء تحميل البيانات',
                          );
                        }

                        if (persons.isEmpty) {
                          return const NotSearchFoundMessage(
                            message: 'عفوا... لا توجد بيانات',
                          );
                        }

                        return PersonsListView(persons: persons);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
