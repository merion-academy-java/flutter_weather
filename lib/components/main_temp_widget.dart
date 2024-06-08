import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/current_response.dart';
import 'package:flutter_weather/api/weather/dto/day_response.dart';
import 'package:flutter_weather/components/container_widget.dart';

class MainTempWidget extends StatelessWidget {
  final int tempC;
  final int feelLikeTempC;
  const MainTempWidget({super.key, required this.tempC, required this.feelLikeTempC});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          height: 64,
            child: Text(
          '$tempC°',
          style: const TextStyle(fontSize: 57),
        )),
        Container(
            alignment: Alignment.bottomLeft,
            height: 64,
            child:Text(
              'Feels like $feelLikeTempC°',
              style: const TextStyle(fontSize: 16),
            ))

      ],
    ));
  }
}
