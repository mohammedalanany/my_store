import 'package:flutter/material.dart';

import '../../../data/models/main_home_model.dart';
import '../../../data/models/product_model.dart';
import '../../../domain/usecases/fetch_recommend_products_usecase.dart';
import '../../../domain/usecases/fetch_store_main_page_usecase.dart';

class StoreMainProvider with ChangeNotifier {
  final FetchStoreMainPageUseCase fetchStoreMainPageUseCase;
  final FetchRecommendsProductsMainPageUseCase
      fetchRecommendsProductsMainPageUseCase;

  StoreMainProvider(this.fetchStoreMainPageUseCase,
      this.fetchRecommendsProductsMainPageUseCase);

  MainHomeModel? _mainHomeModel;
  bool _isLoading = false;
  bool _isLoading2 = false;
  bool get isLoading2 => _isLoading2;

  MainHomeModel? get mainHomeModel => _mainHomeModel;
  bool get isLoading => _isLoading;
  List<ProductModel>? _productModel;
  List<ProductModel>? get recommendsProductModel => _productModel;

  Future<void> fetchStoreMainPage() async {
    _isLoading = true;
    notifyListeners();

    try {
      _mainHomeModel = await fetchStoreMainPageUseCase();
    } catch (error) {
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRecommendsProductsMainPage() async {
    _isLoading2 = true;
    notifyListeners();

    try {
      _productModel = await fetchRecommendsProductsMainPageUseCase();
    } catch (error) {
      throw error;
    } finally {
      _isLoading2 = false;
      notifyListeners();
    }
  }
}
