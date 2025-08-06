import 'package:bmi/core/style_manager.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              result['result'],
              style: StyleManager.heading.copyWith(color: Colors.black),
            ),
          ),
          Text(
            result['bmi'].toString(),
            style: StyleManager.heading.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
