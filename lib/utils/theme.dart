import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_colors.dart';

class ThemeDataForApp {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: APPTHEME_COLOR,
    scaffoldBackgroundColor: Colors.white,
    secondaryHeaderColor: Color(0xffD8DADF),
    primaryColorLight: Colors.white,
    primaryColorDark: Color.fromARGB(255, 181, 60, 36),
    colorScheme: ColorScheme.light(primary: APPTHEME_COLOR),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    fontFamily: "Poppins",
    textTheme: TextTheme(
        titleLarge: TextStyle(
            color: APPTHEME_COLOR, fontSize: 18.sp, fontFamily: "SemiBold"),
        titleMedium: TextStyle(
            color: APPTHEME_COLOR, fontFamily: "Medium", fontSize: 16.sp),
        titleSmall: TextStyle(
            color: APPTHEME_COLOR, fontFamily: "Medium", fontSize: 14.sp),
        headlineMedium: TextStyle(
            color: APPTHEME_COLOR, fontFamily: "SemiBold", fontSize: 16.sp),
        // bodyLarge: TextStyle(
        //     color: TEXT_COLOR, fontWeight: FontWeight.bold, fontSize: 22),
        // bodyMedium: TextStyle(
        //     color: MEDIUM_TEXT_COLOR,
        //     fontWeight: FontWeight.w500,
        //     fontSize: 18),
        // bodySmall: TextStyle(
        //     color: LIGHT_TEXT_COLOR, fontWeight: FontWeight.w300, fontSize: 13),
        // displaySmall: TextStyle(color: MEDIUM_BLACKTEXT_COLOR, fontSize: 12),
        labelSmall: TextStyle(
          color: MEDIUM_BLACKTEXT_COLOR,
          fontSize: 12.sp,
        )),
    iconTheme: IconThemeData(
      color: APPTHEME_COLOR,
      size: 25.h,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ORANGE_COLOR; // Active color
        }
        return MEDIUM_BLACKTEXT_COLOR; // Inactive color
      }),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(APPTHEME_COLOR),
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp)))),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.r))),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50.h)),
            textStyle: WidgetStatePropertyAll(TextStyle(
                color: WHITE_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp)),
            // padding: WidgetStatePropertyAll(EdgeInsets.all(8)),

            backgroundColor: WidgetStatePropertyAll(APPTHEME_COLOR))),
    textSelectionTheme:
        TextSelectionThemeData(selectionHandleColor: APPTHEME_COLOR),
    inputDecorationTheme: InputDecorationTheme(
      // isDense: true,
      suffixIconColor: APPTHEME_COLOR,
      // suffixIconraints: BoxConstraints(maxHeight: 25, maxWidth: 35),
      errorStyle: TextStyle(
          color: INDICATION_COLOR,
          fontWeight: FontWeight.w600,
          fontSize: 11.sp),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(4)),
      //   borderSide: BorderSide(color: MEDIUM_BLACKTEXT_COLOR),
      // ),
      filled: true,
      fillColor: LIGHT_BLACK_SHADE_COLOR,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.r),
      ),
      enabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: LIGHT_BLACK_SHADE_COLOR),
      ),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: LIGHT_BLACK_SHADE_COLOR),
      ),
      focusedErrorBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: INDICATION_COLOR),
      ),
      errorBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: INDICATION_COLOR),
      ),
      hintStyle: TextStyle(
          color: MEDIUM_BLACKTEXT_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: 13.sp),
    ),
    datePickerTheme: DatePickerThemeData(
      // dayBackgroundColor: WidgetStatePropertyAll(APPTHEME_COLOR),
      headerHeadlineStyle: TextStyle(
          color: BLACK_TEXT_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp),
      headerHelpStyle: TextStyle(
          color: BLACK_TEXT_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp),
      weekdayStyle: TextStyle(
          color: BLACK_TEXT_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp),
      dayStyle: TextStyle(
          color: BLACK_TEXT_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(WHITE_COLOR),
            iconColor: WidgetStatePropertyAll(
              APPTHEME_COLOR,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                  color: APPTHEME_COLOR,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.only(top: 20.h, bottom: 20.h, left: 50.w, right: 50.w),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.white),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff17252A)),
  );

  static ThemeData darkTheme =
      // ThemeData(
      //   brightness: Brightness.dark,
      //   primaryColor: Colors.white,
      //   buttonTheme:  ButtonThemeData(
      //     buttonColor: Colors.blueAccent,
      //     disabledColor: Colors.grey,
      //   ),
      //   textTheme:  TextTheme(
      //     titleMedium: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //     titleLarge: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.w800,
      //       fontSize: 18,
      //     ),
      //   ),
      //   iconTheme:  IconThemeData(
      //     color: Colors.black,
      //     size: 100,
      //   ),
      //   appBarTheme:  AppBarTheme(color: Colors.white, centerTitle: true),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //         padding:  WidgetStatePropertyAll(
      //           EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
      //         ),
      //         shape: WidgetStatePropertyAll(
      //           RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //         ),
      //         backgroundColor:  WidgetStatePropertyAll(Colors.white),
      //         foregroundColor:  WidgetStatePropertyAll(Colors.black)),
      //   ),
      //   navigationBarTheme:
      //        NavigationBarThemeData(backgroundColor: Colors.black54),
      // );

      ThemeData(
          brightness: Brightness.dark,
          primaryColor: WHITE_COLOR,
          scaffoldBackgroundColor: BLACK_COLOR,
          secondaryHeaderColor: Color(0xffD8DADF),
          primaryColorLight: Colors.white,
          primaryColorDark: Color.fromARGB(255, 181, 60, 36),
          colorScheme: ColorScheme.light(primary: APPTHEME_COLOR),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          fontFamily: "Poppins",
          textTheme: TextTheme(
              // bodyLarge: TextStyle(
              //     color: BLACK_TEXT_COLOR, fontWeight: FontWeight.bold, fontSize: 22),
              // titleLarge: TextStyle(
              //     color: BLACK_TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
              // bodyMedium: TextStyle(
              //     color: MEDIUM_TEXT_COLOR,
              //     fontWeight: FontWeight.w500,
              //     fontSize: 18),
              ));
}
