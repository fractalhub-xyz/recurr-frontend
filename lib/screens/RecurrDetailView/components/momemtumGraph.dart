import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recurr_fe/models/recurr.dart';

import '../../../constants.dart';

class Momentum extends StatelessWidget {
  const Momentum({
    Key key,
    @required this.height,
    @required this.recurr,
  }) : super(key: key);

  final double height;
  final Recurr recurr;

  @override
  Widget build(BuildContext context) {
    recurr.getMomentum();
    final Color bg = Colors.blueGrey[900];
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(10),
      height: height * 0.4,
      child: Container(
          height: height * 0.3,
          width: double.infinity,
          child: LineChart(data(bg))),
    );
  }
}

LineChartData data(bg) {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  return LineChartData(
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    borderData: FlBorderData(show: false),
    titlesData: FlTitlesData(show: false),
    gridData: FlGridData(
      drawHorizontalLine: false,
      drawVerticalLine: false,
    ),
    backgroundColor: bg,
    lineBarsData: [
      LineChartBarData(
        isCurved: true,
        colors: gradientColors,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
        spots: [
          FlSpot(0, 3),
          FlSpot(1, 1),
          FlSpot(2, 1),
          FlSpot(3, 3),
          FlSpot(4, 1),
          FlSpot(5, 5),
          FlSpot(6, 1),
          FlSpot(7, 5),
          FlSpot(8, 5),
          FlSpot(9, 5),
          FlSpot(10, 5),
          FlSpot(11, 5),
          FlSpot(12, 5),
          FlSpot(13, 5),
        ],
      ),
    ],
  );
}
