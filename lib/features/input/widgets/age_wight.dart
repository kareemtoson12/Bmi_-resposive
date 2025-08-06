import 'package:bmi/core/style_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgeWight extends StatefulWidget {
  final String title;
  double valueAge;
  double valueWeight;
  final bool isWeight;

  AgeWight({
    super.key,
    required this.title,
    required this.valueAge,
    required this.valueWeight,
    required this.isWeight,
  });

  @override
  State<AgeWight> createState() => _AgeWightState();
}

class _AgeWightState extends State<AgeWight> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        /*  margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0), */
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Text(widget.title, style: StyleManager.heading),
            Text(
              widget.isWeight
                  ? widget.valueWeight.toInt().toString()
                  : widget.valueAge.toInt().toString(),
              style: StyleManager.heading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.isWeight
                          ? widget.valueWeight++
                          : widget.valueAge++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.isWeight
                          ? widget.valueWeight--
                          : widget.valueAge--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
