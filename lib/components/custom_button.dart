import 'package:flutter/material.dart';
import 'package:money_app_demo/themes/app_themes.dart';
import 'package:money_app_demo/utils/size_cal.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: AppTheme.buttonColor.withOpacity(0.5),
      padding: EdgeInsets.symmetric(
        horizontal: getPercentageWidth(context, 20.8),
        vertical: getPercentageHeight(context, 1.75),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
    return ElevatedButton(
      style: buttonStyle,
      onPressed: () => onPressed(),
      child: child,
    );
  }
}
