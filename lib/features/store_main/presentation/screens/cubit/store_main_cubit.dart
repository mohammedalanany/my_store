import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/fetch_recommend_products_usecase.dart';
import '../../../domain/usecases/fetch_store_main_page_usecase.dart';
import 'store_main_state.dart';

class StoreMainCubit extends Cubit<StoreMainState> {
  final FetchStoreMainPageUseCase fetchStoreMainPageUseCase;
  final FetchRecommendsProductsMainPageUseCase
      fetchRecommendsProductsMainPageUseCase;

  StoreMainCubit({
    required this.fetchStoreMainPageUseCase,
    required this.fetchRecommendsProductsMainPageUseCase,
  }) : super(StoreMainInitial());

  Future<void> fetchMainStoreData() async {
    emit(StoreMainLoading());
    try {
      final result = await fetchStoreMainPageUseCase.call();
      emit(StoreMainLoaded(result));
      await fetchRecommendedProducts();
    } catch (e) {
      emit(StoreMainError(e.toString()));
    }
  }

  Future<void> fetchRecommendedProducts() async {
    emit(RecommendedProductsLoading());
    try {
      final result = await fetchRecommendsProductsMainPageUseCase.call();
      emit(RecommendedProductsLoaded(result));
    } catch (e) {
      emit(StoreMainError(e.toString()));
    }
  }
}
