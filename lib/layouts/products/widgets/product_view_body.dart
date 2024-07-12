import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:route_product_screen_task/layouts/products/widgets/product_item_widget.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.sizeOf(context).height.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: productHeight(context),
            crossAxisCount: productCount(context),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) => const ProductItemWidget(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: 30,
      ),
    );
  }

  int productCount(BuildContext context) {
    if (MediaQuery.sizeOf(context).width > 900) {
      return 4;
    } else if (MediaQuery.sizeOf(context).width >= 600 &&
        MediaQuery.sizeOf(context).width <= 900) {
      return 3;
    } else {
      return 2;
    }
  }

  double productHeight(BuildContext context) {
    if (MediaQuery.sizeOf(context).width > 900 &&
        MediaQuery.sizeOf(context).height > 400) {
      return MediaQuery.sizeOf(context).height * 0.32;
    } else if (MediaQuery.sizeOf(context).width > 600 &&
        MediaQuery.sizeOf(context).width <= 900 &&
        MediaQuery.sizeOf(context).height > 400) {
      return MediaQuery.sizeOf(context).height * 0.28;
    } else if (MediaQuery.sizeOf(context).width <= 600 &&
        MediaQuery.sizeOf(context).height > 400) {
      return MediaQuery.sizeOf(context).height * 0.28;
    } else {
      return MediaQuery.sizeOf(context).height * 0.8;
    }
  }
}
