import 'package:flutter/material.dart';
import 'package:money_app_demo/themes/app_themes.dart';

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;
  final ValueChanged onChange;

  const NumPad({
    Key? key,
    this.buttonSize = 52,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.onSubmit,
    required this.onChange,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // implement the number keys (from 0 to 9) with the NumberButton widget
          // the NumberButton widget is defined in the bottom of this file
          children: [
            NumberButton(
              number: 1,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
            NumberButton(
              number: 2,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
            NumberButton(
              number: 3,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButton(
              number: 4,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
            NumberButton(
              number: 5,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
            NumberButton(
              number: 6,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButton(
              number: 7,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
            NumberButton(
              number: 8,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
            NumberButton(
              number: 9,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // this button is used to delete the last number
            SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: InkWell(
                onTap: () {
                  controller.text += ".";
                  onChange(".");
                },
                child: const Center(
                  child: Text(
                    ".",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textWhiteColor,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            NumberButton(
              number: 0,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onChange: (v) => onChange(v),
            ),
            // this button is used to submit the entered value
            SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: InkWell(
                onTap: () => delete(),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/left_arrow_icon.png"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;
  final ValueChanged onChange;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.text += number.toString();
        onChange(number.toString());
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textWhiteColor,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
