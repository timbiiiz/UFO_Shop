// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final iconPath;
  final name;
  final price;
  const ProductItem({
    super.key,
    required this.iconPath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 165,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.4),
            Colors.white.withOpacity(0.5),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 40),
          Container(
            width: 150,
            height: 80,
            child: Image.asset(iconPath),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            subtitle: Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
