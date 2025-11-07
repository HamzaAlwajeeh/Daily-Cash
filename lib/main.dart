import 'package:daily_cash/Features/Restrictions/presentation/views/restrictions_view.dart';
import 'package:daily_cash/core/routers/on_generate_route.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
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
        textTheme: ThemeData.dark().textTheme
            .apply(fontFamily: 'NotoSansArabic')
            .copyWith(
              bodyLarge: const TextStyle(color: AppColors.textSecondaryColor),
              bodyMedium: const TextStyle(color: AppColors.textSecondaryColor),
              bodySmall: const TextStyle(color: AppColors.textSecondaryColor),
            ),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: RestrictionsView.routeName,
    );
  }
}
