// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

final _boderRadius = BorderRadius.circular(20);

class ProductBox extends StatelessWidget {
  final height;
  final width;
  final child;

  const ProductBox({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: _boderRadius,
            child: Container(
              color: Colors.white,
              width: width,
              height: width,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
