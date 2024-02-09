import 'package:flutter/material.dart';
import 'themes/app_themes.dart';
import 'package:money_app_demo/utils/route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money App Demo',
      theme: AppTheme.moneyAppThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: route.transactionsPage,
      onGenerateRoute: route.routeController,
    );
  }
}
