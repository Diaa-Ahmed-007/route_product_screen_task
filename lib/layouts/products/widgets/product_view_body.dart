import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_product_screen_task/core/DI/di.dart';
import 'package:route_product_screen_task/layouts/products/view_models/products_view_model_cubit.dart';
import 'package:route_product_screen_task/layouts/products/view_models/products_view_model_state.dart';
import 'package:route_product_screen_task/layouts/products/widgets/product_item_widget.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.sizeOf(context).height.toString());
    return BlocProvider(
      create: (context) => getIt<ProductsViewModelCubit>()..getProducts(),
      child: BlocBuilder<ProductsViewModelCubit, ProductsViewModelState>(
        builder: (context, state) {
          if (state is ProductsViewModelSuccessState) {
            return Padding(
              padding: const EdgeInsets.only(top: 25),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: productHeight(context),
                    crossAxisCount: productCount(context),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) => ProductItemWidget(
                  productEntity: state.productsList[index],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: state.productsList.length,
              ),
            );
          }
          if (state is ProductsViewModelErrorState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              content: Text(state.error),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary),
                  child: const Text(
                    "Try Again",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
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
