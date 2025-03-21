import 'package:equatable/equatable.dart';
import 'package:mystore/features/store_main/data/models/main_home_model.dart';

import '../../../data/models/product_model.dart';

// States
abstract class StoreMainState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StoreMainInitial extends StoreMainState {}

class StoreMainLoading extends StoreMainState {}

class StoreMainLoaded extends StoreMainState {
  final MainHomeModel mainHomeModel;
  StoreMainLoaded(this.mainHomeModel);

  @override
  List<Object?> get props => [mainHomeModel];
}

class RecommendedProductsLoading extends StoreMainState {}

class RecommendedProductsLoaded extends StoreMainState {
  final List<ProductModel> recommendedProducts;
  RecommendedProductsLoaded(this.recommendedProducts);

  @override
  List<Object?> get props => [recommendedProducts];
}

class StoreMainError extends StoreMainState {
  final String message;
  StoreMainError(this.message);

  @override
  List<Object?> get props => [message];
}
