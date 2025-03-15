import 'package:bloc/bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int quantity = 1;
  void addQuantitty() {
    if (quantity < 50) {
      quantity += 1;
      emit(AddQuantity());
    }
  }

  void removeQuantitty() {
    if (quantity > 1) {
      quantity -= 1;
      emit(RemoveQuantity());
    }
  }
}
