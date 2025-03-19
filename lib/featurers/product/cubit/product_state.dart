part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductLoading extends ProductState {}

final class GetProductSucecc extends ProductState {}

final class GetProductErorr extends ProductState {}

final class GetReviewLoading extends ProductState {}

final class GetReviewSucecc extends ProductState {}

final class GetReviewErorr extends ProductState {}

final class PutReviewLoading extends ProductState {}

final class PutReviewSucecc extends ProductState {}

final class PutReviewErorr extends ProductState {}

final class PostReviewLoading extends ProductState {}

final class PostReviewSucecc extends ProductState {}

final class PostReviewErorr extends ProductState {}
