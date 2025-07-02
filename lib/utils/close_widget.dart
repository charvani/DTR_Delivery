import 'package:flutter/material.dart';

import 'common_colors.dart';

class CloseWidget extends StatelessWidget {
  final Function() closeFun;
  const CloseWidget({super.key, required this.closeFun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: closeFun,
      child: CircleAvatar(
        backgroundColor: WHITE_COLOR,
        radius: 10,
        child: Icon(
          Icons.close,
          size: 15,
          color: REDAPPTHEME_COLOR,
        ),
      ),
    );
  }
}
