
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_product_screen_task/core/api/api_manager.dart';
import 'package:route_product_screen_task/core/api/end_points.dart';
import 'package:route_product_screen_task/data/data_source_contract/product_data_source.dart';
import 'package:route_product_screen_task/data/models/product_model/ProductResponse.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImpl extends ProductDataSource {
  ApiManager apiManager;
  @factoryMethod
  ProductDataSourceImpl(this.apiManager);
  @override
  Future<Either<ProductResponse, String>> getProducts() async {
    try {
      var response = await apiManager.getRequest(endPoints: Endpoints.product);
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      return Left(productResponse);
    } on DioException catch (error) {
      if (error.response != null) {
       return Right(error.response?.data.toString()??"");
      } else {
        return Right(error.message ?? "");
      }
    }
  }
}
