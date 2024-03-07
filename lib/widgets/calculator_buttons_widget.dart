import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButtonsWidget extends StatefulWidget {
  const CalculatorButtonsWidget({super.key});

  @override
  State<CalculatorButtonsWidget> createState() =>
      _CalculatorButtonsWidgetState();
}

class _CalculatorButtonsWidgetState extends State<CalculatorButtonsWidget> {
  double firstNumber = 0;
  double secondNumber = 0;
  double result = 0;

  final firstNumberController = TextEditingController();
  final secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  result = firstNumber + secondNumber;
                });
              },
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              child: const Icon(CupertinoIcons.add),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  result = firstNumber - secondNumber;
                });
              },
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              child: const Icon(CupertinoIcons.minus),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  result = firstNumber * secondNumber;
                });
              },
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              child: const Icon(CupertinoIcons.multiply),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  result = firstNumber / secondNumber;
                });
              },
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              child: const Icon(CupertinoIcons.divide),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 132,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    firstNumber = 0.0;
                    secondNumber = 0.0;
                    result = 0;
                    firstNumberController.text = '';
                    secondNumberController.text = '';
                  });
                },
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,
                child: const Icon(CupertinoIcons.delete_left),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 120,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The result is: ${removeDecimalZeroFormat(result)}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String removeDecimalZeroFormat(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
}
