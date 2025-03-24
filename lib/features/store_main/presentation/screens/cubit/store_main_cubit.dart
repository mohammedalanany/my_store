import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/fetch_store_main_page_usecase.dart';
import 'store_main_state.dart';

class StoreMainCubit extends Cubit<StoreMainState> {
  final FetchStoreMainPageUseCase fetchStoreMainPageUseCase;

  StoreMainCubit({
    required this.fetchStoreMainPageUseCase,
  }) : super(StoreMainInitial());

  Future<void> fetchMainStoreData() async {
    emit(StoreMainLoading());

    try {
      final result = await fetchStoreMainPageUseCase.call();
      emit(StoreMainLoaded(result));
    } catch (e) {
      emit(StoreMainError(e.toString()));
    }
  }
}
