import 'package:flutter/material.dart';

import 'common_colors.dart';



class ThemeDataForApp {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: APPTHEME_COLOR,
    scaffoldBackgroundColor: Colors.white,
    secondaryHeaderColor: const Color(0xffD8DADF),
    primaryColorLight: Colors.white,
    primaryColorDark: const Color.fromARGB(255, 181, 60, 36),
    colorScheme: ColorScheme.light(primary: APPTHEME_COLOR),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    fontFamily: "Poppins",
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: TEXT_COLOR, fontWeight: FontWeight.bold, fontSize: 22),
        titleLarge: TextStyle(
            color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
        bodyMedium: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: 18),
        titleMedium: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: 15),
        bodySmall: TextStyle(
            color: LIGHT_TEXT_COLOR, fontWeight: FontWeight.w300, fontSize: 13),
        titleSmall: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: 13),
        displaySmall: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: 12),
        labelSmall: TextStyle(
          color: MEDIUM_BLACK_COLOR,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        )),
    iconTheme: IconThemeData(
      color: APPTHEME_COLOR,
      size: 25,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ORANGE_COLOR; // Active color
        }
        return HINT_TEXT_COLOR; // Inactive color
      }),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(APPTHEME_COLOR),
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontWeight: FontWeight.w600, fontSize: 13)))),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
            minimumSize: WidgetStatePropertyAll(Size(370, 45)),
            textStyle: WidgetStatePropertyAll(TextStyle(
                color: WHITE_COLOR, fontFamily: "SemiBold", fontSize: 16)),
            // padding: WidgetStatePropertyAll(EdgeInsets.all(8)),

            backgroundColor: WidgetStatePropertyAll(APPTHEME_COLOR))),
    textSelectionTheme:
        TextSelectionThemeData(selectionHandleColor: APPTHEME_COLOR),
    inputDecorationTheme: InputDecorationTheme(
      // isDense: true,
      suffixIconColor: APPTHEME_COLOR,
      suffixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 35),
      errorStyle: TextStyle(
          color: INDICATION_COLOR, fontWeight: FontWeight.w600, fontSize: 11),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(4)),
      //   borderSide: BorderSide(color: HINT_TEXT_COLOR),
      // ),
      filled: true,
      fillColor: LIGHT_BLACK_SHADE_COLOR,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
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
          color: HINT_TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 13),
    ),
    datePickerTheme: DatePickerThemeData(
      // dayBackgroundColor: WidgetStatePropertyAll(APPTHEME_COLOR),
      headerHeadlineStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
      headerHelpStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 18),
      weekdayStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
      dayStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(WHITE_COLOR),
            iconColor: WidgetStatePropertyAll(
              APPTHEME_COLOR,
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                  color: APPTHEME_COLOR,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.blueAccent),
      ),
    ),
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff17252A)),
  );

  static ThemeData darkTheme = 
  // ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: Colors.white,
  //   buttonTheme: const ButtonThemeData(
  //     buttonColor: Colors.blueAccent,
  //     disabledColor: Colors.grey,
  //   ),
  //   textTheme: const TextTheme(
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
  //   iconTheme: const IconThemeData(
  //     color: Colors.black,
  //     size: 100,
  //   ),
  //   appBarTheme: const AppBarTheme(color: Colors.white, centerTitle: true),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //         padding: const WidgetStatePropertyAll(
  //           EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
  //         ),
  //         shape: WidgetStatePropertyAll(
  //           RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //         ),
  //         backgroundColor: const WidgetStatePropertyAll(Colors.white),
  //         foregroundColor: const WidgetStatePropertyAll(Colors.black)),
  //   ),
  //   navigationBarTheme:
  //       const NavigationBarThemeData(backgroundColor: Colors.black54),
  // );

  ThemeData(
    brightness: Brightness.dark,
    primaryColor: WHITE_COLOR,
    scaffoldBackgroundColor:BLACK_COLOR,
    secondaryHeaderColor: const Color(0xffD8DADF),
    primaryColorLight: Colors.white,
    primaryColorDark: const Color.fromARGB(255, 181, 60, 36),
    colorScheme: ColorScheme.light(primary: APPTHEME_COLOR),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    fontFamily: "Poppins",
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: TEXT_COLOR, fontWeight: FontWeight.bold, fontSize: 22),
        titleLarge: TextStyle(
            color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
        bodyMedium: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: 18),
        titleMedium: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: 15),
        bodySmall: TextStyle(
            color: LIGHT_TEXT_COLOR, fontWeight: FontWeight.w300, fontSize: 13),
        titleSmall: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: 13),
        displaySmall: TextStyle(
            color: MEDIUM_TEXT_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: 12),
        labelSmall: TextStyle(
          color: MEDIUM_BLACK_COLOR,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        )),
    iconTheme: IconThemeData(
      color: APPTHEME_COLOR,
      size: 25,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ORANGE_COLOR; // Active color
        }
        return HINT_TEXT_COLOR; // Inactive color
      }),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(APPTHEME_COLOR),
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontWeight: FontWeight.w600, fontSize: 13)))),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
            minimumSize: WidgetStatePropertyAll(Size(370, 45)),
            textStyle: WidgetStatePropertyAll(TextStyle(
                color: WHITE_COLOR, fontFamily: "SemiBold", fontSize: 16)),
            // padding: WidgetStatePropertyAll(EdgeInsets.all(8)),

            backgroundColor: WidgetStatePropertyAll(APPTHEME_COLOR))),
    textSelectionTheme:
        TextSelectionThemeData(selectionHandleColor: APPTHEME_COLOR),
    inputDecorationTheme: InputDecorationTheme(
      // isDense: true,
      suffixIconColor: APPTHEME_COLOR,
      suffixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 35),
      errorStyle: TextStyle(
          color: INDICATION_COLOR, fontWeight: FontWeight.w600, fontSize: 11),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(4)),
      //   borderSide: BorderSide(color: HINT_TEXT_COLOR),
      // ),
      filled: true,
      fillColor: LIGHT_BLACK_SHADE_COLOR,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
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
          color: HINT_TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 13),
    ),
    datePickerTheme: DatePickerThemeData(
      // dayBackgroundColor: WidgetStatePropertyAll(APPTHEME_COLOR),
      headerHeadlineStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
      headerHelpStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 18),
      weekdayStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
      dayStyle: TextStyle(
          color: TEXT_COLOR, fontWeight: FontWeight.w500, fontSize: 20),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(WHITE_COLOR),
            iconColor: WidgetStatePropertyAll(
              APPTHEME_COLOR,
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                  color: APPTHEME_COLOR,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.blueAccent),
      ),
    ),
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff17252A)),
  );
}
