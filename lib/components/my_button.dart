import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFFDB8882),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
