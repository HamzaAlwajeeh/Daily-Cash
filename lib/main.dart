import 'package:daily_cash/Features/Persons/data/repos/person_repo_impl.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_cubit.dart';
import 'package:daily_cash/Features/Splash/presentation/views/splash_view.dart';
import 'package:daily_cash/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo_impl.dart';
import 'package:daily_cash/Features/home/presentation/controller/delete_operation_cubit/delete_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_cash_box_cubit/get_cash_box_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_incom_operations_cubit/get_incom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_outcom_operations_cubit/get_outcom_operations_cubit.dart';
import 'package:daily_cash/core/helper/persons_provider.dart';
import 'package:daily_cash/core/routers/on_generate_route.dart';
import 'package:daily_cash/core/services/service_locator.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/services/simple_bloc_obsever.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await Prefs.init();
  runApp(DailyCash());
  Bloc.observer = SimpleBlocObserver();
}

class DailyCash extends StatelessWidget {
  const DailyCash({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(getIt<AuthRepoImpl>())),
        BlocProvider(
          lazy: false,
          create:
              (_) =>
                  GetAllPersonsCubit(getIt<PersonRepoImpl>())..getAllPersons(),
        ),
        BlocProvider(
          create: (_) => GetIncomOperationsCubit(getIt<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (_) => GetOutcomOperationsCubit(getIt<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (_) => DeleteOperationCubit(getIt<HomeRepoImpl>()),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<PersonsProvider>(
            create: (_) => PersonsProvider(),
          ),
          BlocProvider(
            create: (_) => GetAllOperationsCubit(getIt<HomeRepoImpl>()),
          ),
          BlocProvider(create: (_) => GetCashBoxCubit(getIt<HomeRepoImpl>())),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          title: 'Daily Cash',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
            textTheme: ThemeData.dark().textTheme
                .apply(fontFamily: 'NotoSansArabic')
                .copyWith(
                  bodyLarge: const TextStyle(
                    color: AppColors.textSecondaryColor,
                  ),
                  bodyMedium: const TextStyle(
                    color: AppColors.textSecondaryColor,
                  ),
                  bodySmall: const TextStyle(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashView.routeName,
        ),
      ),
    );
  }
}
