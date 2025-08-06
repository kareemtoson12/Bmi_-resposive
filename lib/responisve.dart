import 'package:flutter/material.dart';

class NotResponsive extends StatelessWidget {
  const NotResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Broken Layout")),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          height: 200,
          color: Colors.redAccent,
          child: const Center(
            child: Text(
              "Too wide for small screens!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
