
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_product_screen_task/core/constants.dart';

@singleton
class ApiManager {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseProductUrl,
      ),
    );
  }
  Future<Response> getRequest(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      endPoints,
      queryParameters: queryParameters,
    );
    return response;
  }
}
