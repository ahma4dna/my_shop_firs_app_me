part of 'recently_cubit.dart';

sealed class RecentlyState {}

final class RecentlyInitial extends RecentlyState {}

final class GetRecentlyLoading extends RecentlyState {}

final class GetRecentlySucecc extends RecentlyState {}

final class GetRecentlyErorr extends RecentlyState {}
final class AddRecentlyLoading extends RecentlyState {}

final class AddRecentlySucecc extends RecentlyState {}

final class AddtRecentlyErorr extends RecentlyState {}
final class ClearOneRecentlyLoading extends RecentlyState {}

final class ClearOneRecentlySucecc extends RecentlyState {}

final class ClearOneRecentlyErorr extends RecentlyState {}
final class ClearAllRecentlyLoading extends RecentlyState {}

final class ClearAllRecentlySucecc extends RecentlyState {}

final class ClearAllRecentlyErorr extends RecentlyState {}