import 'package:flutter/material.dart';

class SquareActionButton extends StatelessWidget {
  final Function()? onTapFun;
  final String buttonTitle;
  const SquareActionButton(
      {super.key, required this.buttonTitle, required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTapFun,
      child: Text(buttonTitle),
    );
  }
}
