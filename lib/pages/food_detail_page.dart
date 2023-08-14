import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/my_button.dart';
import 'package:sushi_app/models/food_model.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  const FoodDetailPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int currentCount = 0;

  void decrementCount() {
    if (currentCount < 1) {
      currentCount = 0;
    } else {
      setState(() {
        currentCount--;
      });
    }
  }

  void incrementCount() {
    setState(() {
      currentCount++;
    });
  }

  void addToCart() {
    // only add to cart of the quantity is greater than 0
    if (currentCount > 0) {
      // get access to the shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, currentCount);

      print(shop.cart.length);

      // let the user know it was successful
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: primaryColor,
          content: const Text(
            'Successfully added to the cart',
            style: TextStyle(
                color: clearColor, fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // pop once to get out of the dialog
                Navigator.pop(context);

                // pop again to back the page
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: clearColor,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        surfaceTintColor: bgColor,
        backgroundColor: bgColor,
      ),
      body: Column(
        children: [
          // list view of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  // image name
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25),

                  // ratings
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 15),

                  // description
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip. ipsum dolor sit',
                    style: TextStyle(
                      height: 2,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price and quantity + Add cart btn
          Container(
            padding: const EdgeInsets.all(25),
            color: primaryColor,
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // price
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        color: clearColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        // minus btn
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: clearColor,
                            ),
                            onPressed: () => decrementCount(),
                          ),
                        ),

                        // current quantity
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              currentCount.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: clearColor,
                              ),
                            ),
                          ),
                        ),

                        // plus btn
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: clearColor,
                            ),
                            onPressed: () => incrementCount(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // btn
                MyButton(
                  text: 'Add to cart',
                  onTap: () => addToCart(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
