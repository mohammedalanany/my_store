import 'package:mystore/core/core/services/main_store_services.dart';

import '../models/main_home_model.dart';
import '../models/product_model.dart';

class MainStoreRemoteDataSource {
  Future<MainHomeModel> fetchStoreMainPage() async {
    final response = await MainStoreServices.fetchStoreMainPage();
    print(response);
    return MainHomeModel.fromJson(response);
  }

  Future<List<ProductModel>> fetchMainPageRecommendProducts() async {
    final response = await MainStoreServices.fetchMainPageRecommendsProducts();
    print(response['recommended_products']);
    final mainPageRecommendProducts = response['recommended_products']
        .map<ProductModel>(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
    return mainPageRecommendProducts;
  }

  Future<ProductModel> fetchProductDetails(int productId) async {
    final response = await MainStoreServices.fetchProductDetails(productId);
    print(response);
    return ProductModel.fromJson(response['product']);
  }
}
