// ignore_for_file: prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'dart:ui';
import 'package:flutter/material.dart';

final _boderRadius = BorderRadius.circular(20);

class DetailButton extends StatelessWidget {
  final height;
  final width;

  const DetailButton({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _boderRadius, // final _boderRadius
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            // blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(),
            ),

            // gradient effect
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.4)),
                borderRadius: _boderRadius, // final border radius
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
