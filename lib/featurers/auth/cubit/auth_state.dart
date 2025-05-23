part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSucces extends AuthState {}

final class SignUpErorr extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSucces extends AuthState {}

final class LoginErorr extends AuthState {}

final class LoginGoogleLoading extends AuthState {}

final class LoginGoogleSucces extends AuthState {}

final class LoginGoogleErorr extends AuthState {}

final class SaveDataLoading extends AuthState {}

final class SaveDataSuceccs extends AuthState {}

final class SaveDataErorr extends AuthState {}

final class SignOutLoading extends AuthState {}

final class SignOutSucecc extends AuthState {}

final class SignOutErorr extends AuthState {}

final class GetDataUserLoading extends AuthState {}

final class GetDataUserSucecc extends AuthState {}

final class GetDataUserErorr extends AuthState {}
