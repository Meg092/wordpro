
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class CustomMarquee extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double velocity;
  final double blankSpace;
  final Color fadingEdgeColor;

  const CustomMarquee({
    Key? key,
    required this.text,
    this.textStyle,
    this.velocity = 50.0,
    this.blankSpace = 20.0,
    this.fadingEdgeColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Marquee(
        text: text,
        style: textStyle ?? const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: blankSpace,
        velocity: velocity,
        pauseAfterRound: const Duration(seconds: 1),
        showFadingOnlyWhenScrolling: true,
        fadingEdgeStartFraction: 0.1,
        fadingEdgeEndFraction: 0.1,
      ),
    );
  }
}