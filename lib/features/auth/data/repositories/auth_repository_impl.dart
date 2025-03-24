import 'package:dio/dio.dart';

import '../../../../core/core/depindance_injection/locator_service.dart';
import '../../../store_main/presentation/screens/screens/home_screen_with_cubit.dart';
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
        print(e.response?.statusCode);
        if (e.response?.statusCode == 401) {
        } else if (e.response?.statusCode == 400) {
          await LocatorService.navigationService.currentState!
              .pushNamed(StoreHomeScreenWithCubit.routeName);
        }
      }

      throw Exception("Failed to fetch data: $e");
    }
  }
}
