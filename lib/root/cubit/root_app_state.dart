part of 'root_app_cubit.dart';

sealed class RootAppState {}

final class RootAppInitial extends RootAppState {

}

final class RootAppChangeIndex extends RootAppState {}
final class SaveTheme extends RootAppState {}
final class GetTheame extends RootAppState {}
final class SwitchIsDark extends RootAppState {}
