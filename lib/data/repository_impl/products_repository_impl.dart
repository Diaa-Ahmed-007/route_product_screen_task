import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_product_screen_task/data/data_source_contract/product_data_source.dart';
import 'package:route_product_screen_task/domain/entities/ProductEntity.dart';
import 'package:route_product_screen_task/domain/repository_contract/products_repository.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl extends ProductsRepository {
  ProductDataSource productDataSource;
  @factoryMethod
  ProductsRepositoryImpl(this.productDataSource);

  @override
  Future<Either<List<ProductEntity>, String>> getProducts() async {
    var products = await productDataSource.getProducts();
    return products.fold(
      (result) {
        List<ProductEntity> productList = result.products
                ?.map(
                  (item) => item.toProductEntity(),
                )
                .toList() ??
            [];
        return Left(productList);
      },
      (error) => Right(error),
    );
  }
}
