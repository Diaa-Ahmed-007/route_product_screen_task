import 'package:flutter/material.dart';
import 'package:route_product_screen_task/core/utils/assets.dart';
import 'package:route_product_screen_task/core/utils/strings.dart';
import 'package:svg_flutter/svg.dart';

SliverAppBar productViewAppBar(BuildContext context) {
  return SliverAppBar(
    floating: true,
    snap: true,
    flexibleSpace: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(Assets.assetsImagesRouteAppBarImage)),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        hintText: Strings.searchHint,
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 8),
                          child: SvgPicture.asset(
                            Assets.assetsIconsIconSearch,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn),
                          ),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(minHeight: 30, minWidth: 30),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8)),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(Assets.assetsIconsShoppingCart),
              ],
            ),
          ],
        ),
      ),
    ),
    toolbarHeight: MediaQuery.sizeOf(context).width > 600 &&
            MediaQuery.sizeOf(context).height < 450
        ? MediaQuery.sizeOf(context).height * 0.3
        : MediaQuery.sizeOf(context).height * 0.1,
  );
}
