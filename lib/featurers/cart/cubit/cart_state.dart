part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class AddQuantity extends CartState {}

final class RemoveQuantity extends CartState {}
