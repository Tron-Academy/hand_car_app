import 'package:flutter/material.dart';
import 'package:hand_car/core/theme/color_palette.dart';
import 'package:hand_car/core/theme/extensions/color_extention.dart';
import 'package:hand_car/core/theme/extensions/space_extension.dart';
import 'package:hand_car/core/theme/extensions/typography_extention.dart';
import 'package:hand_car/gen/fonts.gen.dart';

final lightTheme = ThemeData(
    colorSchemeSeed: ColorPalette.blue400,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorPalette.white400,
    appBarTheme: AppBarTheme(backgroundColor: ColorPalette.white400),
    useMaterial3: true,
    extensions: [
      ColorExtention(
          primary: ColorPalette.deepRed,
          primaryTxt: ColorPalette.black400,
          secondaryTxt: ColorPalette.white400,
          backgroundSubtle: ColorPalette.black,
          white: ColorPalette.white400,
          warning: ColorPalette.red200,
          green100: ColorPalette.green100,
          background: ColorPalette.grey,
          btnShadow: ColorPalette.pink,
          containerShadow: ColorPalette.pink200,
          green: ColorPalette.green

          ),
      TypographyExtention(
        h1: TextStyle(
            fontSize: 34,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.bold),
        h2: TextStyle(
            fontSize: 24,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.bold),
        h3: TextStyle(
            fontSize: 20,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.bold),
        subtitle: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w400),
        body: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w500),
        bodySemiBold: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
            fontSize: 12,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w400),
        bodySmallMedium: TextStyle(
            fontSize: 12,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w500),
        bodySmallSemiBold: TextStyle(
            fontSize: 12,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(
            fontSize: 18,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w600),
        bodyLargeMedium: TextStyle(
            fontSize: 18,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w500),
        bodyLargeSemiBold: TextStyle(
            fontSize: 18,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w600),
        caption: TextStyle(
            fontSize: 12,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w400),
        buttonTxt: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.manrope,
            color: ColorPalette.black400,
            fontWeight: FontWeight.w400),
      ),
      AppSpaceExtension.fromBaseSpace(8),
      
    ]);
    
  