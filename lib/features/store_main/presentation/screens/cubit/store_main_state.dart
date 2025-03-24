import 'package:equatable/equatable.dart';

import '../../../data/models/main_home_model.dart';
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

  StoreMainLoaded copyWith({MainHomeModel? mainHomeModel}) {
    return StoreMainLoaded(mainHomeModel ?? this.mainHomeModel);
  }

  @override
  List<Object?> get props => [mainHomeModel];
}

class RecommendedProductsLoading extends StoreMainState {}

class RecommendedProductsLoaded extends StoreMainState {
  final List<ProductModel> recommendedProducts;

  RecommendedProductsLoaded(this.recommendedProducts);

  RecommendedProductsLoaded copyWith(
      {List<ProductModel>? recommendedProducts}) {
    return RecommendedProductsLoaded(
        recommendedProducts ?? this.recommendedProducts);
  }

  @override
  List<Object?> get props => [recommendedProducts];
}

class StoreMainError extends StoreMainState {
  final String message;

  StoreMainError(this.message);

  StoreMainError copyWith({String? message}) {
    return StoreMainError(message ?? this.message);
  }

  @override
  List<Object?> get props => [message];
}

//
class ProductDetailsLoading extends StoreMainState {}

class ProductDetailsInitial extends StoreMainState {}

class ProductDetailsLoaded extends StoreMainState {
  final ProductModel productDetails;
  ProductDetailsLoaded(this.productDetails);
}
