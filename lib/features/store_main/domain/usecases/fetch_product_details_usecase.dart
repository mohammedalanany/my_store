import '../../data/models/product_model.dart';
import '../repositories/main_store_repository.dart';

class FetchProductDetailsUseCase {
  final MainStoreRepository repository;

  FetchProductDetailsUseCase({required this.repository});

  Future<ProductModel> call(int productId) {
    return repository.fetchProductDetails(productId);
  }
}
