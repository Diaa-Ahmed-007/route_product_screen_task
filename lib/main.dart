import 'package:flutter/material.dart';
import 'package:route_product_screen_task/core/DI/di.dart';
import 'package:route_product_screen_task/core/api/api_manager.dart';
import 'package:route_product_screen_task/my_app.dart';

void main() {
  ApiManager.init();
  configureDependencies();
  runApp(const MyApp());
}
