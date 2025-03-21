import '../../../../core/core/services/auth_service.dart';
import '../../domain/entities/login_form_entitiy.dart';

class AuthRemoteDataSource {
  Future<int> checkUser(LoginFormEntity? passData) async {
    final data = {
      "value": passData?.value,
      "type": 'email',
    };
    final statusCode = await AuthServices.checkUser(data);
    print('herer $statusCode');
    return statusCode;
  }
}
