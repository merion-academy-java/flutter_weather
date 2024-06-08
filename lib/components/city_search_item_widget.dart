import 'package:flutter/material.dart';
import 'package:flutter_weather/api/dadata/dto/city_response.dart';
import 'package:flutter_weather/components/card_widget.dart';
import 'package:flutter_weather/components/container_widget.dart';

class CitySearchItemWidget extends StatelessWidget {
  final CityResponse city;
  final Function(CityResponse city) onTap;

  const CitySearchItemWidget(
      {super.key, required this.city, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap(city);
        },
        child: ContainerWidget(
            short: true,
            child: CardWidget(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city.city,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ))));
  }
}
