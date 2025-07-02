// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import 'space_widget.dart';
// import 'theme.dart';

// class ItemIncrementDecrementWidget extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final Function()? itemIncreaseFun;
//   final Function()? itemDecreaseFun;
//   final Function(String)? onChangedFun;
//   final String? Function(String?)? validationFun;
//   final int stockQuantity;
//   final String moq;
//   final Color? symbolColor;
//   final Color? borderColor;
//   final Color? textColor;
//   const ItemIncrementDecrementWidget(
//       {super.key,
//       required this.itemIncreaseFun,
//       required this.textEditingController,
//       required this.itemDecreaseFun,
//       required this.onChangedFun,
//       required this.validationFun,
//       required this.stockQuantity,
//       required this.moq,
//       this.symbolColor,
//       this.borderColor,
//       this.textColor});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 35,
//       padding: EdgeInsets.symmetric(horizontal: 3),
//       decoration: BoxDecoration(
//           // color: Colors.amber,
//           borderRadius: BorderRadius.circular(3),
//           border: Border.all(
//               width: 1.5, color: borderColor ?? LIGHT_BLACK_SHADE_COLOR)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             "QTY",
//             style: TextStyle(
//                 color: HINT_TEXT_COLOR, fontFamily: "Medium", fontSize: 12),
//           ),
//           SpaceWidget(
//             width: 5,
//           ),
//           Container(
//             height: 35,
//             width: 1.5,
//             color: borderColor ?? LIGHT_BLACK_SHADE_COLOR,
//           ),
//           SpaceWidget(
//             width: 5,
//           ),
//           InkWell(
//             onTap: itemDecreaseFun,
//             child:
//                 // const CircleAvatar(
//                 //   backgroundColor: REDAPPTHEME_COLOR,
//                 //   radius: 10,
//                 //   child:
//                 Icon(
//               Icons.remove,
//               size: 17,
//               color: symbolColor ?? MEDIUM_BLACK_COLOR,
//             ),
//             // ),
//           ),
//           const SpaceWidget(width: 3),
//           SizedBox(
//               width: 31,
//               // height: 25,
//               child: TextFormField(
//                 // scrollPadding: EdgeInsets.all(0),
//                 // textAlignVertical: TextAlignVertical.top,
//                 controller: textEditingController,
//                 keyboardType: TextInputType.number,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: Get.textTheme.titleMedium!.copyWith(
//                     color: textColor ?? MEDIUM_BLACK_COLOR, fontSize: 14),
//                 cursorColor: APPTHEME_COLOR,
//                 cursorHeight: 10,
//                 cursorWidth: 1,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsetsDirectional.only(bottom: 17),
//                   hoverColor: APPTHEME_COLOR,
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                 ),
//                 onChanged: onChangedFun,
//                 validator: validationFun,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   TextInputFormatter.withFunction((oldValue, newValue) {
//                     if (newValue.text.isEmpty) {
//                       return newValue; // Allow empty input
//                     }
//                     final numValue = int.tryParse(newValue.text);
//                     if (numValue == null ||
//                         numValue < int.parse(moq) ||
//                         (numValue > stockQuantity)) {
//                       return oldValue; // Reject invalid input
//                     }
//                     return newValue;
//                   }),
//                 ],
//               )),
//           const SpaceWidget(width: 3),
//           InkWell(
//             onTap: itemIncreaseFun,
//             child:
//                 // CircleAvatar(
//                 //   backgroundColor: REDAPPTHEME_COLOR,
//                 //   radius: 10,
//                 //   child:
//                 Icon(
//               Icons.add,
//               size: 17,
//               color: symbolColor ?? MEDIUM_BLACK_COLOR,
//             ),
//             // ),
//           ),
//         ],
//       ),
//     );
//   }
// }
