import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/components/my_button.dart';
import 'package:sushi_app/components/my_textfield.dart';
import 'package:sushi_app/models/food_model.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/pages/food_detail_page.dart';
import 'package:sushi_app/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isFavorite = true;

  void favoriteFoodHandler() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  // navigate to the food item details page
  void navigateToFoodDetailsPage(int index) {
    // get the shop and its details
    final shop = context.read<Shop>();
    final foodMenuList = shop.foodMenuList;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(food: foodMenuList[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and its details
    final shop = context.read<Shop>();
    final foodMenuList = shop.foodMenuList;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        foregroundColor: Colors.grey[800],
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
        title: Text(
          'Sushi ',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey[800],
          ),
        ),
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promo banner
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // promo message
                      Text(
                        'Get 32% Promo',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: clearColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // redeem banner
                      MyButton(
                        text: 'Redeem',
                        onTap: () {},
                      )
                    ],
                  ),
                  Image.asset(
                    'lib/assets/sushi(1).png',
                    height: 100,
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),

            // search bar
            const MyTextfield(),
            const SizedBox(height: 25),

            // menu list
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Food menu',
                style: TextStyle(
                  letterSpacing: 0.1,
                  color: Colors.grey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // popular food
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenuList.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenuList[index],
                  onTap: () {
                    navigateToFoodDetailsPage(index);
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),

            // popular food
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/sushi(1).png',
                        height: 60,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name
                          Text(
                            'Salmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 18,
                            ),
                          ),

                          // price
                          Text(
                            '\$21.00',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => favoriteFoodHandler(),
                    child: isFavorite
                        ? const Icon(
                            Icons.favorite_border_outlined,
                            color: primaryColor,
                            size: 34,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: primaryColor,
                            size: 34,
                          ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
