import 'package:flutter/material.dart';
import 'package:fitness_ui_kit/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fitness_ui_kit/widget/workout_model.dart';
import 'package:fitness_ui_kit/network/network_helper.dart';

import 'workout_model.dart';

class LineChartAPI extends StatefulWidget {
  const LineChartAPI({Key? key}) : super(key: key);

  @override
  State<LineChartAPI> createState() => _LineChartAPIState();
}

class _LineChartAPIState extends State<LineChartAPI> {
  List<Color> gradientColors = [primary];
  List<Welcome> genders = [];
  List<Welcome> tempdata = [];
  bool loading = true;
  NetworkHelper _networkHelper = NetworkHelper();
  var response;
  @override
  double rasha = 0.0;
  void initState() {
    super.initState();
    getData();
  }

  //LineChartAPI();
  Future<void> getData() async {
    response = await _networkHelper
        .get("http://10.0.2.2:3000/getWorkout/6277b4321119d5367cf8b045");
    tempdata = welcomeFromJson("[" + response.body + "]");
    genders = tempdata;
    print(tempdata.toList().elementAt(0).id);

    //bool _r = false;
    bool r = false;

    setState(() {
      genders = tempdata;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : LineChart(
                workoutProgressData(),
              ),
      ),
    );
  }

  LineChartData workoutProgressData() {
    return LineChartData(
      gridData: FlGridData(getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.transparent,
          strokeWidth: 0.1,
        );
      }, getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 0.1,
        );
      }),
      titlesData: FlTitlesData(
          show: true,
          topTitles: SideTitles(
            showTitles: false,
          ),
          bottomTitles: SideTitles(
            getTextStyles: (_, style) {
              return TextStyle(fontSize: 10);
            },
            showTitles: true,
            reservedSize: 22,

            //var value = (genders.toList().elementAt(0).day);
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'Mon';
                case 3:
                  return 'Tue';
                case 5:
                  return 'Wed';
                case 7:
                  return 'Thu';
                case 9:
                  return 'Fri';
                case 11:
                  return 'Sat';
              }
              return '';
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: false,
            reservedSize: 28,
            margin: 12,
          ),
          rightTitles: SideTitles(
            getTextStyles: (_, style) {
              return TextStyle(fontSize: 10);
            },
            showTitles: true,
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '0%';
                case 2:
                  return '20%';
                case 3:
                  return '60%';
                case 4:
                  return '80%';
                case 5:
                  return '100%';
              }
              return '';
            },
            reservedSize: 28,
            margin: 12,
          )),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, (tempdata.toList().elementAt(0).mon.toDouble())),
            FlSpot(2.6, (tempdata.toList().elementAt(0).tue.toDouble())),
            FlSpot(4.9, (tempdata.toList().elementAt(0).wed.toDouble())),
            FlSpot(6.8, (tempdata.toList().elementAt(0).thur.toDouble())),
            FlSpot(8, (tempdata.toList().elementAt(0).fri.toDouble())),
            FlSpot(9.5, (tempdata.toList().elementAt(0).sat.toDouble())),
            FlSpot(11, (tempdata.toList().elementAt(0).sun.toDouble())),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 1.5),
            FlSpot(2.5, 1),
            FlSpot(3, 5),
            FlSpot(5, 2),
            FlSpot(7, 4),
            FlSpot(8, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: [thirdColor.withOpacity(0.5)],
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
