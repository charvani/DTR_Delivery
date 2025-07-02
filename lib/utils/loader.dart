import 'package:flutter/material.dart';

import 'common_colors.dart';

class LoaderWidget extends StatelessWidget {
  final Color? loaderColor;
  const LoaderWidget({super.key, this.loaderColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          color: loaderColor?? APPTHEME_COLOR,
          strokeWidth: 2,
        ),
      ),
    );
  }
}

// Widget LoaderWidget() = Center(
//   child: SizedBox(
//     height: 25,
//     width: 25,
//     child: CircularProgressIndicator(
//       color: APPTHEME_COLOR,
//       strokeWidth: 2,
//     ),
//   ),
// );
