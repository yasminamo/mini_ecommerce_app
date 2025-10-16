import 'package:flutter/material.dart';
import 'package:miniecommerce_app/Models/cart_model.dart';

class CartProviders with ChangeNotifier {
  final List<CartModel> items = [];
  List<CartModel> get Items => items;

  double get totalPrice {
    return items.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void removeFromCart(int id) {
    items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void addToCart(CartModel item) {
    final index = items.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(item);
    }
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
