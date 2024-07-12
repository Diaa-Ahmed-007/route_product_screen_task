import 'package:dartz/dartz.dart';
import 'package:route_product_screen_task/data/models/product_model/ProductResponse.dart';

abstract class ProductDataSource {
  Future<Either<ProductResponse, String>> getProducts();
}
