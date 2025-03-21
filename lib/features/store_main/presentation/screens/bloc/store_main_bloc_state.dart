import 'package:equatable/equatable.dart';
import 'package:mystore/features/store_main/data/models/main_home_model.dart';

import '../../../data/models/product_model.dart';

sealed class StoreMainBlocState extends Equatable {
  const StoreMainBlocState();

  @override
  List<Object?> get props => [];
}

class StoreMainInitial extends StoreMainBlocState {}

class StoreMainLoading extends StoreMainBlocState {}

class StoreMainLoaded extends StoreMainBlocState {
  final MainHomeModel mainHomeModel;

  const StoreMainLoaded(this.mainHomeModel);

  @override
  List<Object?> get props => [mainHomeModel];
}

class RecommendedProductsStoreMainLoading extends StoreMainBlocState {}

class RecommendedProductsLoaded extends StoreMainBlocState {
  final List<ProductModel> recommendedProducts;

  const RecommendedProductsLoaded(this.recommendedProducts);
}

class recommendedProductsMainLoading extends StoreMainBlocState {}

class StoreMainError extends StoreMainBlocState {
  final String message;

  const StoreMainError(this.message);

  @override
  List<Object?> get props => [message];
}
