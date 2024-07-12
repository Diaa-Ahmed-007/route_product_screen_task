import 'package:flutter/material.dart';
import 'package:route_product_screen_task/layouts/products/views/product_view.dart';

class Routes {
  static const String productViewRouteName = "product_view";
 static  Map<String, Widget Function(BuildContext)> getRoutes() =>
      {productViewRouteName: (context) => const ProductView()};
}
