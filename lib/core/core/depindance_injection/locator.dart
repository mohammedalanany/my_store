import 'package:get_it/get_it.dart';

import '../../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../../features/auth/domain/repositories/auth_repository.dart';
import '../../../features/auth/domain/usecases/check_user_usecase.dart';
import '../../../features/auth/screens/cubit/auth_cubit.dart';
import '../../../features/store_main/data/datasources/store_main_remote_data_source.dart';
import '../../../features/store_main/data/repositories/main_store_repository_impl.dart';
import '../../../features/store_main/domain/repositories/main_store_repository.dart';
import '../../../features/store_main/domain/usecases/fetch_product_details_usecase.dart';
import '../../../features/store_main/domain/usecases/fetch_recommend_products_usecase.dart';
import '../../../features/store_main/domain/usecases/fetch_store_main_page_usecase.dart';
import '../../../features/store_main/presentation/screens/bloc/store_main_bloc.dart';
import '../../../features/store_main/presentation/screens/cubit/product_details_cubit.dart';
import '../../../features/store_main/presentation/screens/cubit/recommend_product_cubit.dart';
import '../../../features/store_main/presentation/screens/cubit/store_main_cubit.dart';
import '../../../features/store_main/presentation/screens/store_provider/store_main.dart';
import '../services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupServices() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  locator.registerLazySingleton<MainStoreRemoteDataSource>(
      () => MainStoreRemoteDataSource());

  locator.registerLazySingleton<MainStoreRepository>(
      () => MainStoreRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<FetchStoreMainPageUseCase>(
      () => FetchStoreMainPageUseCase(repository: locator()));

  locator.registerLazySingleton<FetchRecommendsProductsMainPageUseCase>(
      () => FetchRecommendsProductsMainPageUseCase(repository: locator()));

  locator.registerLazySingleton<StoreMainProvider>(
      () => StoreMainProvider(locator(), locator()));

  locator.registerLazySingleton<StoreMainBloc>(() => StoreMainBloc(
        fetchStoreMainPageUseCase: locator<FetchStoreMainPageUseCase>(),
        fetchRecommendsProductsMainPageUseCase:
            locator<FetchRecommendsProductsMainPageUseCase>(),
      ));

  ///
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource());

  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: locator()));

  locator.registerLazySingleton<CheckUserUseCase>(
      () => CheckUserUseCase(authRepository: locator()));

  locator.registerFactory(() => AuthCubit(
        checkUserUseCase: locator<CheckUserUseCase>(),
      ));
  locator.registerLazySingleton<StoreMainCubit>(() => StoreMainCubit(
        fetchStoreMainPageUseCase: locator<FetchStoreMainPageUseCase>(),
      ));
  locator.registerLazySingleton<RecommendsProductsCubit>(
      () => RecommendsProductsCubit(
            fetchRecommendsProductsMainPageUseCase:
                locator<FetchRecommendsProductsMainPageUseCase>(),
          ));
  locator.registerLazySingleton<FetchProductDetailsUseCase>(
      () => FetchProductDetailsUseCase(repository: locator()));

  locator.registerLazySingleton<ProductDetailsCubit>(() => ProductDetailsCubit(
        fetchProductDetailsUseCase: locator<FetchProductDetailsUseCase>(),
      ));
}
