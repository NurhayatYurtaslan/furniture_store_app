import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store_app_bloc/app/model/furniture.dart';
import 'package:furniture_store_app_bloc/app/repository/app_repository.dart';
import 'package:furniture_store_app_bloc/core/extension/app_extension.dart';

part 'app_state.dart';
part "app_event.dart";

class FurnitureBloc extends Bloc<FurnitureEvent, FurnitureState> {
  FurnitureBloc({required this.repository})
      : super(FurnitureState.initial(repository.getFurnitureList)) {
    on<IncreaseQuantityEvent>(_increaseQuantity);
    on<DecreaseQuantityEvent>(_decreaseQuantity);
    on<AddToCartEvent>(_addToCart);
    on<AddToFavoriteEvent>(_addToFavorite);
    on<ClearCartEvent>(_clearCart);
  }

  final Repository repository;

 void _getTotalPrice(Emitter<FurnitureState> emit) {
    double totalPrice = 0.0;

    for (var element in state.mainItems) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }
    emit(FurnitureState(mainItems: state.mainItems, totalPrice: totalPrice));
  }

  void _increaseQuantity(
      IncreaseQuantityEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items =
        state.mainItems.operator(event.furniture, Operation.increase);

    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _decreaseQuantity(
      DecreaseQuantityEvent event, Emitter<FurnitureState> emit) {
    List<Furniture> items = [];
    if (event.furniture.quantity > 1) {
      items = state.mainItems.operator(event.furniture, Operation.decrease);
    } else {
      items = state.mainItems.operator(event.furniture, Operation.delete);
    }

    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _addToCart(AddToCartEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items = state.mainItems.map((element) {
      if (event.furniture.id == element.id) {
        return event.furniture.copyWith(
            cart: true, quantity: state.mainItems[event.index].quantity);
      }
      return element;
    }).toList();

    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _addToFavorite(AddToFavoriteEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items =
        state.mainItems.operator(event.furniture, Operation.favorite);
    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _clearCart(ClearCartEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items = state.mainItems
        .map((element) => element.copyWith(cart: false))
        .toList();

    emit(FurnitureState(mainItems: items));
  }



  get getCartList => state.mainItems.where((element) => element.cart).toList();

  get getFavoriteList =>
      state.mainItems.where((element) => element.isFavorite).toList();
}
