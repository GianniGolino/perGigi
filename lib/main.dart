import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

double firstNumber = 0;
double secondNumber = 0;
double result = 0;

final firstNumberController = TextEditingController();
final secondNumberController = TextEditingController();

// main app tree
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator App'),
          backgroundColor: Colors.blueGrey,
        ),
        body: const Column(
          children: [
            SizedBox(height: 20),
            TextFieldRow(),
            SizedBox(
              height: 120,
            ),
            CalculatorButtons(),
          ],
        ),
      ),
    );
  }
}

// adding textFields
class TextFieldRow extends StatefulWidget {
  const TextFieldRow({super.key});

  @override
  State<TextFieldRow> createState() => _TextFieldRowState();
}

class _TextFieldRowState extends State<TextFieldRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'First number'),
            controller: firstNumberController,
            onChanged: (inputText) {
              firstNumberController.text = inputText;
              firstNumber = double.parse(inputText);
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Second number'),
            controller: secondNumberController,
            onChanged: (inputText) {
              secondNumberController.text = inputText;
              secondNumber = double.parse(inputText);
            },
          ),
        ),
      ],
    );
  }
}

// adding calculator buttons functionalities and displaying results
class CalculatorButtons extends StatefulWidget {
  const CalculatorButtons({super.key});

  @override
  State<CalculatorButtons> createState() => _CalculatorButtonsState();
}

class _CalculatorButtonsState extends State<CalculatorButtons> {
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
              'The result is: $result',
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
