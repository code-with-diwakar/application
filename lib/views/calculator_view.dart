import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  num x = 0;
  num y = 0;
  num z = 0;
  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // To make the content scrollable if it overflows
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                CalculatorDisplay(
                    hint: "Enter First Number",
                    controller: displayOneController),
                const SizedBox(
                  height: 30,
                ),
                CalculatorDisplay(
                    hint: "Enter the Second Number",
                    controller: displayTwoController),
                const SizedBox(height: 30), // Replace Spacer with SizedBox
                Text(
                  z.toString(),
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Closed Text widget here
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Space between buttons
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                         setState(() {
                       int firstNumber = int.tryParse(displayOneController.text) ?? 0;
                      int secondNumber = int.tryParse(displayTwoController.text) ?? 0;
                       z = firstNumber + secondNumber;
                     });
                      },
                      child: const Icon(CupertinoIcons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                     setState(() {
                       int firstNumber = int.tryParse(displayOneController.text) ?? 0;
                      int secondNumber = int.tryParse(displayTwoController.text) ?? 0;
                       z = firstNumber - secondNumber;
                     });
                      },
                      child: const Icon(CupertinoIcons.minus),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                       setState(() {
                       int firstNumber = int.tryParse(displayOneController.text) ?? 0;
                      int secondNumber = int.tryParse(displayTwoController.text) ?? 0;
                       z = firstNumber * secondNumber;
                     });
                      },
                      child: const Icon(CupertinoIcons.multiply),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                       int firstNumber = int.tryParse(displayOneController.text) ?? 0;
                      int secondNumber = int.tryParse(displayTwoController.text) ?? 0;
                       z = firstNumber / secondNumber;
                     });

                      },
                      child: const Icon(CupertinoIcons.divide),
                    ),
                  ],
                ),
              FloatingActionButton.extended(
  onPressed: () {
    setState(() {
      x = 0;
      y = 0;
      z = 0;
      displayOneController.text = x.toString(); // Reset text field to "0"
      displayTwoController.text = y.toString(); // Reset text field to "0"
    });
  },
  label: const Text("Clear"),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint = "Enter the number",
    required this.controller,
  });
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only numbers
      ],
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black87, // Border color when focused
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87, // Border color when unfocused
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black, // Changed to black for visibility
        ),
      ),
    );
  }
}
