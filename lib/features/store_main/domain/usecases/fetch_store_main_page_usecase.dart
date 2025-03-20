import '../../data/models/main_home_model.dart';
import '../repositories/main_store_repository.dart';

class FetchStoreMainPageUseCase {
  final MainStoreRepository repository;

  FetchStoreMainPageUseCase({required this.repository});

  Future<MainHomeModel> call() {
    return repository.fetchStoreMainPage();
  }
}
