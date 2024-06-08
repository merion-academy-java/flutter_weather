import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



class LineChartWidget extends StatefulWidget {
  final List<FlSpot> spots;

  const LineChartWidget({super.key, required this.spots});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 0,
          top: 12,
          bottom: 12,
        ),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
    );
    String hour = value.toInt() % 2 == 0 ? '${value.toInt()}' : '';

    Widget text = Text(hour, style: style);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15,
    );
    String text = value.toInt() % 5 == 0 ? '${value.toInt()}°' : '';
    return Padding(padding: const EdgeInsets.only(right: 8), child: Text(text, style: style, textAlign: TextAlign.right),);
  }

  LineChartData mainData() {
    var minY = widget.spots[0].y;
    var maxY= widget.spots[0].y;

    for(FlSpot spot in widget.spots){
      if(minY > spot.y) minY = spot.y;
      if(maxY < spot.y) maxY = spot.y;
    }

    minY -= 5;
    maxY += 5;

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color.fromRGBO(0, 0, 0, 0.13),
            strokeWidth: (value.toInt() % 4) == 0 ? 2 : 0,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 32,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: widget.spots,
          isCurved: true,
          barWidth: 2,
          isStrokeCapRound: true,
          color: Colors.black,
          dotData: const FlDotData(
            show: false,
          ),
          // belowBarData: BarAreaData(
          //   show: true,
            // gradient: LinearGradient(
            //   colors: gradientColors
            //       .map((color) => color.withOpacity(0.3))
            //       .toList(),
            // ),
          // ),
        ),
      ],
    );
  }

}