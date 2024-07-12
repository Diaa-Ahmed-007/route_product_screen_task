import 'package:flutter/material.dart';
import 'package:route_product_screen_task/layouts/products/widgets/product_view_app_bar.dart';
import 'package:route_product_screen_task/layouts/products/widgets/product_view_body.dart';


class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [productViewAppBar(context)],
        body: const ProductViewBody(),
      ),
    );
  }

}
