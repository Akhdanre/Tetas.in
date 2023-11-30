part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String token;

  AuthSuccess({required this.token});
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
