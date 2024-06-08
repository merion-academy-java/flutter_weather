import 'package:flutter/material.dart';
import 'package:flutter_weather/commons/colors.dart';
import 'package:flutter_weather/components/card_widget.dart';
import 'package:flutter_weather/components/icon_widget.dart';

class SunInfoWidget extends StatelessWidget {
  final String type;
  final String time;
  const SunInfoWidget({super.key, required this.time, required this.type});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Row(
        children: [
          const IconWidget(
            icon: Icons.wb_cloudy_outlined,
          ),
          const SizedBox(width: 8,),
          Container(
            height: 42,
            width: 70,
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type, style: const TextStyle(fontSize: 15),),
                Text(time, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
              ],
            ),
          ),
          const SizedBox(width: 8,),
          Container(
            height: 42,
            alignment: Alignment.bottomLeft,
            child: const Text('4h ago'),
          ),
        ],
      ),
    );
  }
}
