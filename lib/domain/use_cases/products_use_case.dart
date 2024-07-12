import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_product_screen_task/domain/entities/ProductEntity.dart';
import 'package:route_product_screen_task/domain/repository_contract/products_repository.dart';

@injectable
class ProductsUseCase {
  ProductsRepository productsRepository;
  @factoryMethod
  ProductsUseCase(this.productsRepository);
  Future<Either<List<ProductEntity>, String>> call() =>
      productsRepository.getProducts();
}
