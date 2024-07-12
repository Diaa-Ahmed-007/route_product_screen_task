import 'package:dartz/dartz.dart';
import 'package:route_product_screen_task/domain/entities/ProductEntity.dart';

abstract class ProductsRepository {
  Future<Either<List<ProductEntity>, String>> getProducts();
}
