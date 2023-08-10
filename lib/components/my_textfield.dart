// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sushi_app/theme/colors.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search here',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: clearColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: clearColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: clearColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
