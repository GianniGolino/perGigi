import 'package:calculator_app/widgets/calculator_buttons_widget.dart';
import 'package:calculator_app/widgets/textfield_row_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

// main app tree
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstNumber = 0;
  double secondNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator App'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            TextFieldRowWidget(
              onChangedFirstNumber: (p0) {
                firstNumber = double.parse(p0);
              },
              onChangedSecondNumber: (p0) {
                secondNumber = double.parse(p0);
              },
            ),
            const SizedBox(
              height: 120,
            ),
            const CalculatorButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
