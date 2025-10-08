import 'package:daily_cash/Features/Splash/views/splash_view.dart';
import 'package:daily_cash/core/routers/on_generate_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DailyCash());
}

class DailyCash extends StatelessWidget {
  const DailyCash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Cash',
      theme: ThemeData.dark(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
