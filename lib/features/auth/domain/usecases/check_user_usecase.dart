import '../entities/login_form_entitiy.dart';
import '../repositories/auth_repository.dart';

class CheckUserUseCase {
  final AuthRepository authRepository;

  CheckUserUseCase({required this.authRepository});

  Future<int> call(LoginFormEntity data) async {
    return await authRepository.checkUser(data);
  }
}
