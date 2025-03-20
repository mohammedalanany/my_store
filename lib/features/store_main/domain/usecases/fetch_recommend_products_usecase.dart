import '../../data/models/product_model.dart';
import '../repositories/main_store_repository.dart';

class FetchRecommendsProductsMainPageUseCase {
  final MainStoreRepository repository;

  FetchRecommendsProductsMainPageUseCase({required this.repository});

  Future<List<ProductModel>> call() {
    return repository.fetchMainPageRecommendsProducts();
  }
}
