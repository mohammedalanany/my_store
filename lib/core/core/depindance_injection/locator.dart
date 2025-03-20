import 'package:get_it/get_it.dart';

import '../../../features/store_main/data/datasources/store_main_remote_data_source.dart';
import '../../../features/store_main/data/repositories/main_store_repository_impl.dart';
import '../../../features/store_main/domain/repositories/main_store_repository.dart';
import '../../../features/store_main/domain/usecases/fetch_recommend_products_usecase.dart';
import '../../../features/store_main/domain/usecases/fetch_store_main_page_usecase.dart';
import '../../../features/store_main/presentation/screens/store_provider/store_main.dart';

GetIt locator = GetIt.instance;

Future<void> setupServices() async {
  // ✅ Register Remote Data Source
  locator.registerLazySingleton<MainStoreRemoteDataSource>(
      () => MainStoreRemoteDataSource());

  // ✅ Register Repository (depends on Remote Data Source)
  locator.registerLazySingleton<MainStoreRepository>(
      () => MainStoreRepositoryImpl(remoteDataSource: locator()));

  // ✅ Register Use Cases (depends on Repository)
  locator.registerLazySingleton<FetchStoreMainPageUseCase>(
      () => FetchStoreMainPageUseCase(repository: locator()));

  locator.registerLazySingleton<FetchRecommendsProductsMainPageUseCase>(
      () => FetchRecommendsProductsMainPageUseCase(repository: locator()));

  // ✅ Register Provider (depends on Use Cases) **Use positional arguments**
  locator.registerLazySingleton<StoreMainProvider>(
      () => StoreMainProvider(locator(), locator()));

  //
}
