import 'dart:async';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ClockCard extends StatefulWidget {
  const ClockCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<ClockCard> createState() => _ClockCardState();
}

class _ClockCardState extends State<ClockCard> {
  String formattedTime = '';
  String formattedDate = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      return _updateDateNdTime();
    });
  }

  void _updateDateNdTime() {
    DateTime now = DateTime.now();
    final dateFormatter = DateFormat('yMd');
    final timeFormatter = DateFormat('jms');

    setState(
      () {
        formattedDate = dateFormatter.format(now);
        formattedTime = timeFormatter.format(now);
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          width: widget.screenWidth * 0.72,
          height: widget.screenHeight * 0.19,
          decoration: BoxDecoration(
            color: const Color.fromARGB(20, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildText(formattedDate, 22),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildText(formattedTime, 40),
                    const SizedBox(width: 9),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildText(String text, double fontSize) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }
}
