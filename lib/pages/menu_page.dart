import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/components/my_button.dart';
import 'package:sushi_app/components/my_textfield.dart';
import 'package:sushi_app/models/food_model.dart';
import 'package:sushi_app/pages/food_detail_page.dart';
import 'package:sushi_app/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenuList = [
    FoodModel(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'lib/assets/sushi(2).png',
      rating: '4.9',
    ),
    FoodModel(
      name: 'Tuna',
      price: '22.00',
      imagePath: 'lib/assets/sushi(2).png',
      rating: '4.9',
    ),
  ];

  // navigate to the food item details page
  void navigateToFoodDetailsPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(food: foodMenuList[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Sushi ',
          style: TextStyle(
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
              margin: EdgeInsets.only(bottom: 30),
              padding: EdgeInsets.all(20),
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
                  const Icon(
                    Icons.favorite,
                    color: primaryColor,
                    size: 34,
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
