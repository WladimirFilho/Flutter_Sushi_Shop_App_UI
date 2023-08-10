import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/models/food_model.dart';

class FoodTile extends StatelessWidget {
  final FoodModel food;

  const FoodTile({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image
          Image.asset(
            food.imagePath,
            height: 120,
          ),

          // text
          Text(
            food.name,
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),

          // price + rating
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // price
                Text('\$' + food.price),

                // rating
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    Text(
                      food.rating,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
