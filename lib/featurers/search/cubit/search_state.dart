part of 'search_cubit.dart';


sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class GetProductSeLoadingSerc extends SearchState {}

final class GetProductSeSuceccSer extends SearchState {}

final class GetProductSeErorr extends SearchState {}
final class GetProductSuceccCat extends SearchState {}
final class GetProductSuceccMarka extends SearchState {}
final class GetProductSuceccSe extends SearchState {}
final class GetProductSuceccMarkaAndCategory extends SearchState {}

final class ClearFilter extends SearchState {}