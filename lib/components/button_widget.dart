import 'package:flutter/material.dart';
import 'package:flutter_weather/commons/colors.dart';

class ButtonWidget extends StatelessWidget {
  final bool isActive;
  final String text;
  final VoidCallback onTap;

  const ButtonWidget(
      {super.key,
      required this.isActive,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              isActive ? WeatherColors.accent : Colors.white),
          minimumSize: MaterialStateProperty.all<Size>(const Size(116, 42)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ))),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
