import 'package:daily_cash/Features/Splash/presentation/views/splash_view.dart';
import 'package:daily_cash/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
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

  //register testing => Done

  // AuthRepoImpl authRepoImpl = AuthRepoImpl(ApiService(Dio()));
  // Either<Failure, User> user = await authRepoImpl.register(
  //   name: 'Hamza',
  //   email: 'ha20mz10@gmail.com',
  //   password: '12345678',
  // );
  // user.fold(
  //   (failure) => log('Error: ${failure.errorMessage}'),
  //   (user) => log('Registered User: ${user.toString()}'),
  // );
}

class DailyCash extends StatelessWidget {
  const DailyCash({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(getIt<AuthRepoImpl>()),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<PersonsProvider>(
            create: (_) => PersonsProvider(),
          ),
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
