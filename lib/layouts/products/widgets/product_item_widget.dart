import 'package:flutter/material.dart';
import 'package:route_product_screen_task/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0x4C004182)),
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
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg"),
                        fit: BoxFit.cover),
                    shape: RoundedRectangleBorder(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Nike Air Jordon",
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Nike shoes flexible for wo..",
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
                          "EGP 1,200",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "2,000",
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
                          "Review (4.6)",
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
}
