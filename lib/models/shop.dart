// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:sushi_app/models/food_model.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenuList = [
    Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'lib/assets/sushi(2).png',
      rating: '4.9',
    ),
    Food(
      name: 'Tuna',
      price: '22.00',
      imagePath: 'lib/assets/sushi.png',
      rating: '4.9',
    ),
    Food(
      name: 'Uramaki',
      price: '17.00',
      imagePath: 'lib/assets/uramaki.png',
      rating: '4.9',
    ),
    Food(
      name: 'Sushi pack',
      price: '21.00',
      imagePath: 'lib/assets/sushi(1).png',
      rating: '4.9',
    ),
  ];

  // costumers cart
  List<Food> _cart = [];

  // get methods
  List<Food> get foodMenuList => _foodMenuList;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food foodModel) {
    _cart.remove(foodModel);
    notifyListeners();
  }
}
