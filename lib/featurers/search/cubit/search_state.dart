part of 'search_cubit.dart';


sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class GetProductLoading extends SearchState {}

final class GetProductSucecc extends SearchState {}

final class GetProductErorr extends SearchState {}
final class GetProductSuceccCat extends SearchState {}
final class GetProductSuceccMarka extends SearchState {}
final class GetProductSuceccSe extends SearchState {}
final class GetProductSuceccMarkaAndCategory extends SearchState {}