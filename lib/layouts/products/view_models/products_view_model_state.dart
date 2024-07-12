import 'package:route_product_screen_task/domain/entities/ProductEntity.dart';

sealed class ProductsViewModelState {}

final class ProductsViewModelInitial extends ProductsViewModelState {}

final class ProductsViewModelSuccessState extends ProductsViewModelState {
  List<ProductEntity> productsList;
  ProductsViewModelSuccessState(this.productsList);
}

final class ProductsViewModelErrorState extends ProductsViewModelState {
  String error;
  ProductsViewModelErrorState(this.error);
}
final class ProductsViewModelLoadingState extends ProductsViewModelState {}
