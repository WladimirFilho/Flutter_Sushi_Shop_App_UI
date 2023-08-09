import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/my_button.dart';
import 'package:sushi_app/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // shop name
              Text(
                'SUSHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),

              // icon
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'lib/assets/sushi(2).png',
                ),
              ),
              const SizedBox(height: 10),

              // title
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // subtitle
              const Text(
                'Feel the taste of the most popular Japanese food from anywhere and anytime',
                style: TextStyle(color: Color(0xFFDFDFDF), height: 2),
              ),

              const SizedBox(
                height: 20,
              ),

              MyButton(
                text: 'Get started',
                onTap: () {
                  print('tapped');
                  Navigator.pushNamed(context, '/menupage');
                },
              )

              // get started button
            ],
          ),
        ),
      ),
    );
  }
}
