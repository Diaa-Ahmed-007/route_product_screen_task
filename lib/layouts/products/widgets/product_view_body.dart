import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_product_screen_task/core/DI/di.dart';
import 'package:route_product_screen_task/domain/entities/ProductEntity.dart';
import 'package:route_product_screen_task/layouts/products/view_models/products_view_model_cubit.dart';
import 'package:route_product_screen_task/layouts/products/view_models/products_view_model_state.dart';
import 'package:route_product_screen_task/layouts/products/widgets/product_item_widget.dart';
import 'package:route_product_screen_task/layouts/products/widgets/product_layout.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsViewModelCubit>()..getProducts(),
      child: BlocBuilder<ProductsViewModelCubit, ProductsViewModelState>(
        builder: (context, state) {
          if (state is ProductsViewModelSuccessState) {
            List<ProductEntity> productEntity = state.productsList;
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900 &&
                    MediaQuery.sizeOf(context).height > 400) {
                  return ProductLayOut(
                      height: MediaQuery.sizeOf(context).height * 0.32,
                      count: 4,
                      productEntity: productEntity);
                } else if (MediaQuery.sizeOf(context).width > 600 &&
                    MediaQuery.sizeOf(context).width <= 900 &&
                    MediaQuery.sizeOf(context).height > 400) {
                  return ProductLayOut(
                      height: MediaQuery.sizeOf(context).height * 0.28,
                      count: 3,
                      productEntity: productEntity);
                } else if (MediaQuery.sizeOf(context).width <= 600 &&
                    MediaQuery.sizeOf(context).height > 400) {
                  return ProductLayOut(
                      height: MediaQuery.sizeOf(context).height * 0.28,
                      count: 2,
                      productEntity: productEntity);
                }
                else{
                return ProductLayOut(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      count: 2,
                      productEntity: productEntity);
                }
              },
            );
          }
          if (state is ProductsViewModelErrorState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              content: const Text(
                "there is an error try again",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
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
