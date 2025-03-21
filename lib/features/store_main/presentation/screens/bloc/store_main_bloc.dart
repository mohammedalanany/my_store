import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/features/store_main/presentation/screens/bloc/store_main_bloc_state.dart';
import 'package:mystore/features/store_main/presentation/screens/bloc/store_main_events.dart';

import '../../../domain/usecases/fetch_recommend_products_usecase.dart';
import '../../../domain/usecases/fetch_store_main_page_usecase.dart';

class StoreMainBloc extends Bloc<StoreMainEvent, StoreMainBlocState> {
  final FetchStoreMainPageUseCase fetchStoreMainPageUseCase;
  final FetchRecommendsProductsMainPageUseCase
      fetchRecommendsProductsMainPageUseCase;

  StoreMainBloc({
    required this.fetchStoreMainPageUseCase,
    required this.fetchRecommendsProductsMainPageUseCase,
  }) : super(StoreMainInitial()) {}
  Future<void> onFetchMainStoreData(
      FetchMainStoreDataEvent event, Emitter<StoreMainBlocState> emit) async {
    emit(StoreMainLoading());
    final result = await fetchStoreMainPageUseCase();
    emit(StoreMainLoaded(result));
  }

  Future<void> onFetchRecommendedProducts(FetchRecommendedProductsEvent event,
      Emitter<StoreMainBlocState> emit) async {
    emit(RecommendedProductsStoreMainLoading());
    final result = await fetchRecommendsProductsMainPageUseCase.call();
    emit(RecommendedProductsLoaded(result));
  }
  // Trigger both events when the Bloc is created
}
