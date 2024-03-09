import 'package:flutter/material.dart';
import 'package:clock_app/widgets/card.dart';
import 'package:clock_app/widgets/circle.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double circleWidth = screenWidth * 0.35;
    double circleHeight = screenHeight * 0.20;

    final blueCircle = Positioned(
      top: screenHeight * 0.49,
      left: screenWidth * 0.01,
      child: Circle(
        color1: Colors.blue.shade900,
        color2: Colors.blue,
        circleWidth: circleWidth,
        circleHeight: circleHeight,
      ),
    );

    final redCircle = Positioned(
      top: screenHeight * 0.31,
      right: screenWidth * 0.01,
      child: Circle(
        color1: Colors.red.shade900,
        color2: Colors.redAccent,
        circleWidth: circleWidth,
        circleHeight: circleHeight,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          blueCircle,
          redCircle,
          Center(
            child: ClockCard(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          )
        ],
      ),
    );
  }
}
