part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductLoading extends ProductState {}

final class GetProductSucecc extends ProductState {}

final class GetProductErorr extends ProductState {}

final class GetReviewLoading extends ProductState {}

final class GetReviewSucecc extends ProductState {}

final class GetReviewErorr extends ProductState {}
