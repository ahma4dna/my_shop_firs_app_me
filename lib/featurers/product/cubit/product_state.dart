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

final class GetLikeProductLoading extends ProductState {}

final class GetLikeProductSucecc extends ProductState {}

final class GetLikeProductErorr extends ProductState {}

final class PostLikeProductLoading extends ProductState {}

final class PostLikeProductSucecc extends ProductState {}

final class PostLikeProductErorr extends ProductState {}

final class UnLikeProductLoading extends ProductState {}

final class UnLikeProductSucecc extends ProductState {}

final class UnLikeProductErorr extends ProductState {}

final class UnLikeAllProductLoading extends ProductState {}

final class UnLikeAllProductSucecc extends ProductState {}

final class UnLikeAllProductErorr extends ProductState {}
final class GetImageSliderLoading extends ProductState {}
final class GetImageSliderSucecc extends ProductState {}
final class GetImageSliderErorr extends ProductState {}