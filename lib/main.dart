import 'package:daily_cash/Features/Splash/views/splash_view.dart';
import 'package:daily_cash/core/routers/on_generate_route.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Prefs.init();
  runApp(DailyCash());
}

class DailyCash extends StatelessWidget {
  const DailyCash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'NotoSansArabic',
        ),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
