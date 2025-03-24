import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/fetch_recommend_products_usecase.dart';
import 'store_main_state.dart';

class RecommendsProductsCubit extends Cubit<StoreMainState> {
  final FetchRecommendsProductsMainPageUseCase
      fetchRecommendsProductsMainPageUseCase;

  RecommendsProductsCubit({
    required this.fetchRecommendsProductsMainPageUseCase,
  }) : super(StoreMainInitial());

  Future<void> fetchRecommendedProducts() async {
    print('herer fetchRecommendedProducts');
    emit(RecommendedProductsLoading());
    try {
      final result = await fetchRecommendsProductsMainPageUseCase.call();
      emit(RecommendedProductsLoaded(result));
    } catch (e) {
      emit(StoreMainError(e.toString()));
    }
  }
}
