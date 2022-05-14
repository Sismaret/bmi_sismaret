import 'package:bmi_sismaret/view/homevw.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // title: 'BMI Calculator',
    initialRoute: '/',
    routes: {
      '/': (context) => const home(),
    },
  ));
}
