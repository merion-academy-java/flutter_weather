import 'package:flutter/material.dart';
import 'package:flutter_weather/commons/colors.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  const CardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 65,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: WeatherColors.main,
      ),
      child: child,
    );
  }
}
