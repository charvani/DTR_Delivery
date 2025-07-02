// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:medblooms_pharmacy/utils/loader.dart';

// class CommonCachedNetworkImage extends StatelessWidget {
//   final String imagePath;
//   final double? height;
//   final double? width;
//   final BoxFit? boxfit;
//   final double? loaderHeight;
//   const CommonCachedNetworkImage(
//       {super.key,
//       required this.imagePath,
//       this.width,
//       this.height,
//       this.loaderHeight,
//       this.boxfit});

//   @override
//   Widget build(BuildContext context) {
//     return (imagePath.isEmpty)
//         ? Image.asset("assets/Icons/dtr_icon.png", height: height)
//         : CachedNetworkImage(
//             imageUrl: imagePath,
//             height: height ?? 100,
//             width: width,
//             memCacheWidth: 800, // Resize image in memory
//             memCacheHeight: 800,
//             progressIndicatorBuilder: (context, url, progress) => SizedBox(
//               width: 80,
//               height: loaderHeight,
//               child: LoaderWidget(),
//             ),
//             fit: boxfit,
//             errorWidget: (context, url, error) => Image.asset(
//               "assets/Icons/dtr_icon.png",
//               height: height,
//             ),
//           );
//   }
// }
