import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/hour_response.dart';
import 'package:flutter_weather/components/card_title_widget.dart';
import 'package:flutter_weather/components/card_widget.dart';
import 'package:flutter_weather/components/chance_of_rain_item_widget.dart';
import 'package:flutter_weather/components/container_widget.dart';

class ChangeOfRainWidget extends StatelessWidget {
  final List<HourResponse> hours;

  const ChangeOfRainWidget({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        child: CardWidget(
            child: Column(
      children: [
        const CardTitleWidget(
          title: 'chance of rain',
          icon: Icons.cloudy_snowing,
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          children: [
            ChanceOfRainItemWidget(
              title: '7am',
              chance: hours[7].chanceOfRain!,
            ),
            const SizedBox(
              height: 12,
            ),
            ChanceOfRainItemWidget(
              title: '10am',
              chance: hours[10].chanceOfRain!,
            ),
            const SizedBox(
              height: 12,
            ),
            ChanceOfRainItemWidget(
              title: '4pm',
              chance: hours[16].chanceOfRain!,
            ),
            const SizedBox(
              height: 12,
            ),
            ChanceOfRainItemWidget(
              title: '8pm',
              chance: hours[20].chanceOfRain!,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        )
      ],
    )));
  }
}
