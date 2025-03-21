import 'package:dio/dio.dart';

import '../../../../core/core/services/api_service.dart';
import '../../domain/entities/login_form_entitiy.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  Future<int> checkUser(LoginFormEntity? data) async {
    try {
      final response = await authRemoteDataSource.checkUser(data);
      return response;
    } catch (e) {
      if (e is DioException) {
        ApiService.handleApiError(e);
      }
      throw Exception("Failed to fetch data: $e");
    }
  }
}
