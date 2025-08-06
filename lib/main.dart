import 'package:bmi/responisve.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotResponsive(),
      debugShowCheckedModeBanner: false,
    );
  }
}
