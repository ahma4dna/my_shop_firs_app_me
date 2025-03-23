part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class AddQuantity extends CartState {}

final class RemoveQuantity extends CartState {}

final class GetCardsLoading extends CartState {}

final class GetCardsSucecc extends CartState {}

final class GetCardsErorr extends CartState {}

final class AddCardsLoading extends CartState {}

final class AddCardsSucecc extends CartState {}

final class AddCardsErorr extends CartState {}

final class RemoveCardsLoading extends CartState {}

final class RemoveCardsSucecc extends CartState {}

final class RemoveCardsErorr extends CartState {}

final class UpdateQuantityCardsLoading extends CartState {}

final class UpdateQuantityCardsSucecc extends CartState {}

final class UpdateQuantityCardsErorr extends CartState {}

final class RemoveAllCardsLoading extends CartState {}

final class RemoveAllCardsSucecc extends CartState {}

final class RemoveAllCardsErorr extends CartState {}

final class UpdateTotalPriceProdctLoading extends CartState {}

final class UpdateTotalPriceProdctSucecc extends CartState {}

final class UpdateTotalPriceProdctErorr extends CartState {}
