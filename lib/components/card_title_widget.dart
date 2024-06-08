import 'package:flutter/material.dart';
import 'package:flutter_weather/components/icon_widget.dart';

class CardTitleWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const CardTitleWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(children: [
        IconWidget(icon: icon),
        const SizedBox(width: 8,),
        Text(title, style: const TextStyle(fontSize: 14),)
      ],),
    );
  }
}
