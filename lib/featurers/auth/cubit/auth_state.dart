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