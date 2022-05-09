import 'package:fitness_ui_kit/network/network_helper.dart';
import 'package:fitness_ui_kit/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:fitness_ui_kit/widget/milk_model.dart';

List<Color> gradientColors = [primary];
List<Welcome> genders = [];
List<Welcome> tempdata = [];

bool loading = true;
const List latestWorkoutJson = [
  {
    "img": "assets/images/workout_1.png",
    "title": "Fullbody Workout",
    "description": "180 Calories Burn | 20minutes",
    "progressBar": 0.3
  },
  {
    "img": "assets/images/workout_2.png",
    "title": "Lowerbody Workout",
    "description": "200 Calories Burn | 30minutes",
    "progressBar": 0.4
  },
  {
    "img": "assets/images/workout_3.png",
    "title": "Ab Workout",
    "description": "180 Calories Burn | 20minutes",
    "progressBar": 0.2
  }
];

const List latestActivityJson = [
  {
    "img": "assets/images/drinking_water.png",
    "title": "Drinking 300ml Water",
    "time_ago": "About 3 minutes ago"
  },
  {
    "img": "assets/images/eat_snack.png",
    "title": "Eat Snack (Fitbar)",
    "time_ago": "About 10 minutes ago"
  },
];

class Milk extends StatefulWidget {
  const Milk({Key? key}) : super(key: key);

  @override
  State<Milk> createState() => _MilkState();
}

class _MilkState extends State<Milk> {
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
        .get("http://10.0.2.2:3000/getMilk/626f11174faa0d66477b3a3f");
    tempdata = welcomeFromJson("[" + response.body + "]");
    genders = tempdata;
    print(tempdata.toList().elementAt(0).id);
    print((tempdata.toList().elementAt(0).sun.toDouble() - 1.5));

    //bool _r = false;
    bool r = false;

    setState(() {
      genders = tempdata;
      loading = false;
    });
  }

  getlist() {
    List weekly = [
      {
        "day": "Sun",
        "count": (tempdata.toList().elementAt(0).sun.toDouble() - 1.5),
        "color": [secondary, primary]
      },
      {
        "day": "Mon",
        "count": (tempdata.toList().elementAt(0).mon.toDouble() - 3.8),
        "color": [fourthColor, thirdColor]
      },
      {
        "day": "Tue",
        "count": (tempdata.toList().elementAt(0).tue.toDouble() - 3.8),
        "color": [secondary, primary]
      },
      {
        "day": "Wed",
        "count": (tempdata.toList().elementAt(0).wed.toDouble() - 2.8),
        "color": [fourthColor, thirdColor]
      },
      {
        "day": "Thu",
        "count": (tempdata.toList().elementAt(0).thur.toDouble() - 0.8),
        "color": [secondary, primary]
      },
      {
        "day": "Fri",
        "count": (tempdata.toList().elementAt(0).fri.toDouble() - 3.8),
        "color": [fourthColor, thirdColor]
      },
      {
        "day": "Sat",
        "count": (tempdata.toList().elementAt(0).sat.toDouble() - 2.8),
        "color": [secondary, primary]
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading ? CircularProgressIndicator() : getlist(),
      ),
    );
  }
}

const List weekly = [
  {
    "day": "Sun",
    "count": 0.1,
    "color": [secondary, primary]
  },
  {
    "day": "Mon",
    "count": 0.08,
    "color": [fourthColor, thirdColor]
  },
  {
    "day": "Tue",
    "count": 0.12,
    "color": [secondary, primary]
  },
  {
    "day": "Wed",
    "count": 0.075,
    "color": [fourthColor, thirdColor]
  },
  {
    "day": "Thu",
    "count": 0.09,
    "color": [secondary, primary]
  },
  {
    "day": "Fri",
    "count": 0.05,
    "color": [fourthColor, thirdColor]
  },
  {
    "day": "Sat",
    "count": 0.097,
    "color": [secondary, primary]
  }
];
    

    /*
getlist() {
  List weekly = [
    {
      "day": "Sun",
      "count": (tempdata.toList().elementAt(0).sun.toDouble() - 1.5),
      "color": [secondary, primary]
    },
    {
      "day": "Mon",
      "count": (tempdata.toList().elementAt(0).mon.toDouble() - 3.8),
      "color": [fourthColor, thirdColor]
    },
    {
      "day": "Tue",
      "count": (tempdata.toList().elementAt(0).tue.toDouble() - 3.8),
      "color": [secondary, primary]
    },
    {
      "day": "Wed",
      "count": (tempdata.toList().elementAt(0).wed.toDouble() - 2.8),
      "color": [fourthColor, thirdColor]
    },
    {
      "day": "Thu",
      "count": (tempdata.toList().elementAt(0).thur.toDouble() - 0.8),
      "color": [secondary, primary]
    },
    {
      "day": "Fri",
      "count": (tempdata.toList().elementAt(0).fri.toDouble() - 3.8),
      "color": [fourthColor, thirdColor]
    },
    {
      "day": "Sat",
      "count": (tempdata.toList().elementAt(0).sat.toDouble() - 2.8),
      "color": [secondary, primary]
    }
  ];
}
*/

/*
List weekly = [
  {
    "day": "Sun",
    "count": (tempdata.toList().elementAt(0).sun.toDouble() - 1.5),
    "color": [secondary, primary]
  },
  {
    "day": "Mon",
    "count": (tempdata.toList().elementAt(0).mon.toDouble() - 3.8),
    "color": [fourthColor, thirdColor]
  },
  {
    "day": "Tue",
    "count": (tempdata.toList().elementAt(0).tue.toDouble() - 3.8),
    "color": [secondary, primary]
  },
  {
    "day": "Wed",
    "count": (tempdata.toList().elementAt(0).wed.toDouble() - 2.8),
    "color": [fourthColor, thirdColor]
  },
  {
    "day": "Thu",
    "count": (tempdata.toList().elementAt(0).thur.toDouble() - 0.8),
    "color": [secondary, primary]
  },
  {
    "day": "Fri",
    "count": (tempdata.toList().elementAt(0).fri.toDouble() - 3.8),
    "color": [fourthColor, thirdColor]
  },
  {
    "day": "Sat",
    "count": (tempdata.toList().elementAt(0).sat.toDouble() - 2.8),
    "color": [secondary, primary]
  }
];
*/