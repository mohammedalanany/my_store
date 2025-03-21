import '../entities/login_form_entitiy.dart';

abstract class AuthRepository {
  Future<int> checkUser(LoginFormEntity? data);
}
