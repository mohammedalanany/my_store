import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mystore/features/store_main/data/models/main_home_model.dart';
import 'package:mystore/features/store_main/data/models/product_model.dart';

import '../../../../core/core/services/api_service.dart';
import '../../domain/repositories/main_store_repository.dart';
import '../datasources/store_main_remote_data_source.dart';

class MainStoreRepositoryImpl extends MainStoreRepository {
  final MainStoreRemoteDataSource remoteDataSource;

  MainStoreRepositoryImpl({
    required this.remoteDataSource,
  });

  Future<MainHomeModel> fetchStoreMainPage() async {
    EasyLoading.show();
    try {
      final result = await remoteDataSource.fetchStoreMainPage();
      return result;
    } catch (e) {
      if (e is DioException) {
        ApiService.handleApiError(e);
      }
      throw Exception("Failed to fetch data: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  Future<List<ProductModel>> fetchMainPageRecommendsProducts() async {
    EasyLoading.show();
    try {
      final result = await remoteDataSource.fetchMainPageRecommendProducts();
      return result;
    } catch (e) {
      if (e is DioException) {
        ApiService.handleApiError(e);
      }
      throw Exception("Failed to fetch data: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
