import 'package:fitness_ui_kit/network/network_helper.dart';
import 'package:fitness_ui_kit/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:fitness_ui_kit/widget/milk_model.dart';

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
