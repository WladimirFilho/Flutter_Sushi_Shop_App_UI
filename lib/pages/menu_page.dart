import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/my_button.dart';
import 'package:sushi_app/components/my_textfield.dart';
import 'package:sushi_app/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
            SizedBox(
              height: 25,
            ),

            // search bar
            MyTextfield(),
            const SizedBox(height: 25),

            // menu list
            Text(
              'Food menu',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            // popular food
          ],
        ),
      ),
    );
  }
}
