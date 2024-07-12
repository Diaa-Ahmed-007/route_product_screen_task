import 'package:flutter/material.dart';
import 'package:route_product_screen_task/config/app_theme.dart';
import 'package:route_product_screen_task/core/utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.getRoutes(),
      initialRoute: Routes.productViewRouteName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}