import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_product_screen_task/domain/use_cases/products_use_case.dart';
import 'package:route_product_screen_task/layouts/products/view_models/products_view_model_state.dart';

@injectable
class ProductsViewModelCubit extends Cubit<ProductsViewModelState> {
  ProductsViewModelCubit(this.productsUseCase)
      : super(ProductsViewModelInitial());
  @factoryMethod
  ProductsUseCase productsUseCase;
  getProducts() async {
    emit(ProductsViewModelLoadingState());
    var response = await productsUseCase.call();
    response.fold(
      (products) {
        emit(ProductsViewModelSuccessState(products));
      },
      (error) => emit(ProductsViewModelErrorState(error)),
    );
  }
}
