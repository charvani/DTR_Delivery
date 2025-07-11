import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final Function()? onTapFun;
  final String buttonTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  const CustomActionButton(
      {super.key,
      required this.buttonTitle,
      required this.onTapFun,
      this.backgroundColor,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTapFun,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(color: titleColor),
      ),
    );
  }
}
