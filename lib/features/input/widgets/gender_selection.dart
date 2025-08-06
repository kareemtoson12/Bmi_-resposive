import 'package:bmi/core/colors_manager.dart';
import 'package:bmi/core/style_manager.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final String gender;
  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  const GenderSelection({
    super.key,
    required this.gender,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),

          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.secondary
                : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Icon(icon, size: 100, color: Colors.white),
              SizedBox(height: 10),
              Text(gender, style: StyleManager.heading),
            ],
          ),
        ),
      ),
    );
  }
}
