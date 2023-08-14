// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/my_button.dart';
import 'package:sushi_app/models/food_model.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCartHandler(Food food, BuildContext context) {
    // get access to the shop
    final shop = context.read<Shop>();

    // remove from the cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, index) => Scaffold(
        appBar: AppBar(
          foregroundColor: clearColor,
          backgroundColor: primaryColor,
          title: const Text('My cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food cart
                  final Food food = value.cart[index];

                  // get food price
                  final String foodPrice = food.price;

                  // ger food name
                  final String foodName = food.name;

                  // return tile
                  return Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 0.04),
                      ),
                      subtitle: Text('AU\$ ' '$foodPrice'),
                      trailing: IconButton(
                        onPressed: () => removeFromCartHandler(food, context),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyButton(text: 'Pay now', onTap: () {}),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
