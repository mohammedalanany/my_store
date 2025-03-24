import '../../data/models/main_home_model.dart';
import '../../data/models/product_model.dart';

abstract class MainStoreRepository {
  Future<MainHomeModel> fetchStoreMainPage();
  Future<List<ProductModel>> fetchMainPageRecommendsProducts();
  Future<ProductModel> fetchProductDetails(int productId);
}
