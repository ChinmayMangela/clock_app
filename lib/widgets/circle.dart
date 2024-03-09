import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.color1,
    required this.color2,
    required this.circleWidth,
    required this.circleHeight,
  });

  final Color color1;
  final Color color2;
  final double circleWidth;
  final double circleHeight;

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: circleWidth,
        height: circleHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color1,
              color2,
            ],
          ),
        ),
      );
  }
}
