import 'package:application/views/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          color: Colors.indigo,
          child: CalculatorView()
      ));
  }
}