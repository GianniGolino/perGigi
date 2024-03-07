import 'package:flutter/material.dart';

class TextFieldRowWidget extends StatefulWidget {
  //final double firstNumber;
  //final double secondNumber;
  final Function(String) onChangedFirstNumber;
  final Function(String) onChangedSecondNumber;

  const TextFieldRowWidget(
      { //required this.firstNumber,
      //required this.secondNumber,
      required this.onChangedFirstNumber,
      required this.onChangedSecondNumber,
      super.key});

  @override
  State<TextFieldRowWidget> createState() => _TextFieldRowWidgetState();
}

class _TextFieldRowWidgetState extends State<TextFieldRowWidget> {
  final firstNumberController = TextEditingController();
  final secondNumberController = TextEditingController();

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
              widget.onChangedFirstNumber(firstNumberController.text);
              //widget.firstNumber = double.parse(inputText);
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
              widget.onChangedFirstNumber(secondNumberController.text);
              //widget.secondNumber = double.parse(inputText);
            },
          ),
        ),
      ],
    );
  }
}
