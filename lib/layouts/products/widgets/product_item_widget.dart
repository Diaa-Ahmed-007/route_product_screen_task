import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_product_screen_task/core/utils/assets.dart';
import 'package:route_product_screen_task/domain/entities/ProductEntity.dart';
import 'package:svg_flutter/svg.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 2, color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 153,
                    right: 8,
                    bottom: 90,
                  ),
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          productEntity.images?[0] ?? "",
                        ),
                        fit: BoxFit.cover),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(top: 8, right: 8),
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: SvgPicture.asset(Assets.assetsIconsHeartIcon),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      productEntity.title ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      productEntity.description ?? "",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "EGP ${getPriceAfterSale().toStringAsFixed(2)}",
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          productEntity.price?.toStringAsFixed(2) ?? "",
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Text(
                          "Review (${productEntity.rating})",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SvgPicture.asset(Assets.assetsIconsReviewStar),
                        const Spacer(),
                        SvgPicture.asset(
                          Assets.assetsIconsAddIcon,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  double getPriceAfterSale() {
    return productEntity.price! *
        (1 - (productEntity.discountPercentage! / 100));
  }
}
