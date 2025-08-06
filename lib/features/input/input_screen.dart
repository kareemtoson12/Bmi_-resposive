import 'package:bmi/core/colors_manager.dart';
import 'package:bmi/core/style_manager.dart';
import 'package:bmi/features/input/widgets/age_wight.dart';
import 'package:bmi/features/input/widgets/gender_selection.dart';
import 'package:bmi/features/result/result_screen.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String selectedGender = 'male';
  double valueHight = 100;
  double valueAge = 20;
  double valueWeight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ResultScreen(
                  result: calculateBMI(
                    age: valueAge,
                    gender: selectedGender,
                    height: valueHight,
                    weight: valueWeight,
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          color: ColorsManager.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('Calculate', style: StyleManager.heading)],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("BMI Calculator", style: StyleManager.heading),
        centerTitle: true,
        backgroundColor: ColorsManager.primary,
        elevation: 5,
        shadowColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                GenderSelection(
                  onTap: () {
                    setState(() {
                      selectedGender = 'male';
                    });
                  },
                  gender: 'male',
                  icon: Icons.male,
                  isSelected: selectedGender == 'male',
                ),
                GenderSelection(
                  gender: 'female',
                  icon: Icons.female,
                  isSelected: selectedGender == 'female',

                  onTap: () {
                    setState(() {
                      selectedGender = 'female';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(8.0),

              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Text('Height', style: StyleManager.heading),
                  Text(
                    valueHight.toInt().toString(),
                    style: StyleManager.heading,
                  ),
                  Slider(
                    activeColor: ColorsManager.secondary,
                    min: 100,
                    max: 220,
                    value: valueHight,
                    onChanged: (double newValue) {
                      setState(() {
                        valueHight = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              spacing: 15,
              children: [
                AgeWight(
                  isWeight: true,
                  title: 'Weight',
                  valueAge: valueAge,
                  valueWeight: valueWeight,
                ),
                AgeWight(
                  isWeight: false,
                  title: 'Age',
                  valueAge: valueAge,
                  valueWeight: valueWeight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> calculateBMI({
    required String gender,
    required double age,
    required double height, // in cm
    required double weight, // in kg
  }) {
    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    String resultText;

    if (bmi < 18.5) {
      resultText = "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      resultText = "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      resultText = "Overweight";
    } else {
      resultText = "Obese";
    }

    return {
      'gender': gender,
      'age': age,
      'bmi': bmi.toStringAsFixed(2),
      'result': resultText,
    };
  }
}
