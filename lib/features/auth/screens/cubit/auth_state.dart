// States
import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class CheckUserLoading extends AuthState {}

class CheckUserLoaded extends AuthState {
  final int? statusCode;

  CheckUserLoaded(this.statusCode);
}

class CheckUserError extends AuthState {
  final String message;
  CheckUserError(this.message);
}
