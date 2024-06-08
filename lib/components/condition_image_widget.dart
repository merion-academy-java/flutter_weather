import 'package:flutter/material.dart';
import 'package:flutter_weather/api/weather/dto/condition_response.dart';

class ConditionImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxFit fit;
  final Alignment alignment;
  final ConditionResponse conditionResponse;
  const ConditionImageWidget({super.key, required this.width, required this.height, required this.fit, required this.alignment, required this.conditionResponse});

  @override
  Widget build(BuildContext context) {
    String asset = 'assets/cloud.png';

    if(conditionResponse.code == 1000) {
      asset = 'assets/cloud_sunny.png';
    }

    return Image.asset(asset, width: width, height: 54, fit: fit, alignment: alignment,);
  }
}
