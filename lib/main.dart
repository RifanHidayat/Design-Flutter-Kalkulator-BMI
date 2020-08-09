import 'package:flutter/material.dart';

import 'package:kalkulatorbmi/ui/Kalkulator_bmi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',

      home: BMIScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
