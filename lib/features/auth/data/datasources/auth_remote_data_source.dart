import '../../../../core/core/services/auth_service.dart';
import '../../domain/entities/login_form_entitiy.dart';

class AuthRemoteDataSource {
  Future<int> checkUser(LoginFormEntity? passData) async {
    final data = {
      "value": passData?.value,
      "type": 'email',
    };

    final response = await AuthServices.checkUser(data);
    return response;
  }
}
