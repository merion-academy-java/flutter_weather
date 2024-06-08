import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/astronomy_response.dart';
import 'package:flutter_weather/components/container_widget.dart';
import 'package:flutter_weather/components/sun_info_widget.dart';

class AstronomyWidget extends StatelessWidget {
  final AstroResponse astroResponse;
  const AstronomyWidget({super.key, required this.astroResponse});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(child: Row(children: [
      SunInfoWidget(type: 'Sunrise',time: astroResponse.sunrise!,),
      Expanded(child: Container()),
      SunInfoWidget(type: 'Sunset', time: astroResponse.sunset!,),
    ],));
  }
}
