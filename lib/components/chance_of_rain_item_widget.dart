import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/commons/colors.dart';

class ChanceOfRainItemWidget extends StatelessWidget {
  final String title;
  final int chance;
  const ChanceOfRainItemWidget({super.key, required this.chance, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45,
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        Expanded(
            child: Stack(
          children: [
            Container(
              height: 24,
              decoration: const BoxDecoration(
                  color: WeatherColors.chartSecond,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            FractionallySizedBox(
              widthFactor: chance.toDouble() / 100.0,

              child: Container(
                // width: double.infinity,
                height: 24,
                decoration: const BoxDecoration(
                    color: WeatherColors.chartAccent,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            )
          ],
        )),
        const SizedBox(
          width: 22,
        ),
        Container(
          width: 45,
          child: Text(
            '$chance%',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
