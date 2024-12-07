import 'package:dio/dio.dart';
import 'package:hand_car/config.dart';
import 'package:hand_car/features/Accessories/controller/model/products/products_model.dart';
import 'package:hand_car/features/Accessories/controller/model/serach_products/search_response_model.dart';

class ProductsApiServices {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    validateStatus: (status) => status! < 500,
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<List<ProductsModel>> getProducts() async {
    try {
      final response = await _dio.get('/view_product');
      final List<dynamic> productList = response.data['product'];
      return productList.map((json) => ProductsModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch products: ${e.message}');
    }
  }

  Future<SearchResponse> searchProducts(String query) async {
    try {
      final response = await _dio
          .get('/searchproducts/', queryParameters: {'search': query});
      return SearchResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Search failed: ${e.message}');
    }
  }
}
