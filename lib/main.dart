
// @dart=2.9

import 'package:fitness_ui_kit/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    onGenerateRoute: router.generateRoute,
));
}

