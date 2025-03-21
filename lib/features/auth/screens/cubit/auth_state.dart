import 'package:equatable/equatable.dart';

// States
sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class CheckUserLoading extends AuthState {}

class CheckUserLoaded extends AuthState {
  final int? statusCode;

  CheckUserLoaded(this.statusCode);
}

class CheckUserError extends AuthState {
  final String message;
  CheckUserError(this.message);

  @override
  List<Object?> get props => [message];
}
