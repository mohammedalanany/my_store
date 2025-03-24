import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/fetch_product_details_usecase.dart';
import 'store_main_state.dart';

class ProductDetailsCubit extends Cubit<StoreMainState> {
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  ProductDetailsCubit({
    required this.fetchProductDetailsUseCase,
  }) : super(ProductDetailsInitial());
  int productId = 0;

  Future<void> fetchProductDetails() async {
    print('herrer $productId');

    emit(ProductDetailsLoading());
    try {
      final result = await fetchProductDetailsUseCase.call(productId);
      emit(ProductDetailsLoaded(result));
    } catch (e) {
      emit(StoreMainError(e.toString()));
    }
  }

  Future<void> getProductId(int id) async {
    productId = id;
  }
}
