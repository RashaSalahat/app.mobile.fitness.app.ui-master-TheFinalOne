import 'package:flutter/material.dart';
import 'package:fitness_ui_kit/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fitness_ui_kit/network/network_helper.dart';
import 'package:fitness_ui_kit/widget/sleep_model.dart';
import 'workout_model.dart';

class SleepChartAPI extends StatefulWidget {
  const SleepChartAPI({Key? key}) : super(key: key);

  @override
  State<SleepChartAPI> createState() => _SleepChartAPIState();
}

class _SleepChartAPIState extends State<SleepChartAPI> {
  List<Color> gradientColors = [primary];
  List<Welcom> genders = [];
  List<Welcom> tempdata = [];
  bool loading = true;
  int length = 0;
  double mon = 0.0;
  double tue = 0.0;
  double wed = 0.0;
  double thur = 0.0;

  double fri = 0.0;
  double sat = 0.0;
  double sun = 0.0;
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
    response = await _networkHelper.get("http://10.0.2.2:3000/getSleep/Rasha");
    tempdata = welcomFromJson("[" + response.body + "]");
    genders = tempdata;
    length = tempdata.toList().length;
    if (length != 0) print(tempdata.toList().elementAt(0).id);
    if (length != 0) {
      mon = (tempdata.toList().elementAt(length - 1).mon.toDouble());
      tue = (tempdata.toList().elementAt(length - 1).tue.toDouble());
      wed = (tempdata.toList().elementAt(length - 1).wed.toDouble());
      thur = (tempdata.toList().elementAt(length - 1).thur.toDouble());
      fri = (tempdata.toList().elementAt(length - 1).fri.toDouble());
      sat = (tempdata.toList().elementAt(length - 1).sat.toDouble());
      sun = (tempdata.toList().elementAt(length - 1).sun.toDouble());
    }

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
                sleepData(),
              ),
      ),
    );
  }

  LineChartData sleepData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
          show: false,
          leftTitles: SideTitles(
            showTitles: false,
          ),
          rightTitles: SideTitles(
            showTitles: false,
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
            FlSpot(0, (mon)),
            FlSpot(2.6, (tue)),
            FlSpot(4.9, (wed)),
            FlSpot(6.8, (thur)),
            FlSpot(8, (fri)),
            FlSpot(9.5, (sat)),
            FlSpot(11, (sun)),
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
            FlSpot(0, 1),
            FlSpot(3.8, 2.2),
            FlSpot(5.11, 5.2),
            FlSpot(6.10, 3.3),
            FlSpot(8.2, 4.2),
            FlSpot(9.5, 3),
            FlSpot(11.2, 4.2),
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
            FlSpot(0.4, 3.9),
            FlSpot(3.2, 2.6),
            FlSpot(5.16, 5.6),
            FlSpot(6.12, 3.9),
            FlSpot(8.6, 4.6),
            FlSpot(9.9, 3.5),
            FlSpot(11.6, 4.6),
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
          colors: [thirdColor],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0.2, 2.5),
            FlSpot(2.7, 2),
            FlSpot(3.3, 5.3),
            FlSpot(5.3, 2.3),
            FlSpot(7.3, 4.3),
            FlSpot(8.3, 3.3),
            FlSpot(11.3, 4.3),
          ],
          isCurved: true,
          colors: [thirdColor],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0.7, 2.7),
            FlSpot(2.7, 2.7),
            FlSpot(3.7, 5.7),
            FlSpot(5.7, 2.7),
            FlSpot(7.7, 4.7),
            FlSpot(8.7, 3.7),
            FlSpot(11.7, 4.7),
          ],
          isCurved: true,
          colors: [thirdColor],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
