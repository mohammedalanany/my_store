import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_form_entitiy.dart';
import '../../domain/usecases/check_user_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final CheckUserUseCase checkUserUseCase;

  AuthCubit({
    required this.checkUserUseCase,
  }) : super(AuthInitial());

  Future<void> checkUser(LoginFormEntity? data) async {
    emit(CheckUserLoading());
    print('CheckUserLoading cubit');
    try {
      final result = await checkUserUseCase.call(data!);
      emit(CheckUserLoaded(result));
    } catch (e) {
      emit(CheckUserError(e.toString()));
    }
  }
}
