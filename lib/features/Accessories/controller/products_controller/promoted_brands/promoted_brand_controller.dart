import 'package:hand_car/features/Accessories/controller/model/promoted_brands/promoted_brands_model.dart';
import 'package:hand_car/features/Accessories/controller/products_controller/products_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'promoted_brand_controller.g.dart';

@riverpod
class PromotedBrandController extends _$PromotedBrandController{
  Future<List<PromotedBrandsModel>> build() async {
    return fetchBrands();
  }

  Future<List<PromotedBrandsModel>> fetchBrands() async {
    try {
      final productsApiService = ref.read(productsApiServiceProvider);
      return await productsApiService.getPromotedProducts();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
 }