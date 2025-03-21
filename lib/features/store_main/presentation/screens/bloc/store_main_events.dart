import 'package:equatable/equatable.dart';

abstract class StoreMainEvent extends Equatable {
  const StoreMainEvent();

  @override
  List<Object> get props => [];
}

// Event for fetching main store data
class FetchMainStoreDataEvent extends StoreMainEvent {}

// Event for fetching recommended products
class FetchRecommendedProductsEvent extends StoreMainEvent {}
