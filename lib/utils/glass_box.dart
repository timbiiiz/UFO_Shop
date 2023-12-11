// ignore_for_file: prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'dart:ui';
import 'package:flutter/material.dart';

final _boderRadius = BorderRadius.circular(20);

class GlassBox extends StatelessWidget {
  final height;
  final width;
  final child;

  const GlassBox({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _boderRadius, // final _boderRadius
      child: Container(
        width: width, // double e.g. 200.0 (小数点重要)
        height: height, // double e.g. 300.0 (小数点重要)
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

            // child
            Center(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
