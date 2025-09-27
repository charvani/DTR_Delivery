import 'package:flutter/material.dart';
import 'package:with_opacity/with_opacity.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xffD3D3DD).withCustomOpacity(0.5),
    );
  }
}
