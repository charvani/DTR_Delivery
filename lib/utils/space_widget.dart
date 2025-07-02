// To give space between widgets
import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  final double? height, width;
  const SpaceWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
