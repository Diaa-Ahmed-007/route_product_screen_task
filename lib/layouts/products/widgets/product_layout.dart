import 'package:flutter/material.dart';
import 'package:route_product_screen_task/domain/entities/ProductEntity.dart';
import 'package:route_product_screen_task/layouts/products/widgets/product_item_widget.dart';

class ProductLayOut extends StatelessWidget {
  const ProductLayOut(
      {super.key,
      required this.height,
      required this.count,
      required this.productEntity});
  final double height;
  final int count;
  final List<ProductEntity> productEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: height,
            crossAxisCount: count,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) => ProductItemWidget(
          productEntity: productEntity[index],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: productEntity.length,
      ),
    );
  }
}
