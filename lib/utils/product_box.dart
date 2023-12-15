// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

final _boderRadius = BorderRadius.circular(20);

class ProductBox extends StatelessWidget {
  final width;
  final height;
  final child;

  const ProductBox({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: _boderRadius,
          child: Container(
            color: Colors.white54,
            width: width,
            height: height,
            child: child,
          ),
        ),
      ],
    );
  }
}
