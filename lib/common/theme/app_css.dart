import 'package:flutter/material.dart';
import 'package:quize_app_bsp_tech/common/theme/colors.dart';
part 'scale.dart';

class AppCss {
  // *************************** AnyBody Fonts ***************************
  static TextStyle anyBodyExtraBold48White = const TextStyle(
      fontFamily: Fonts.anybodyExtraExpandedBold,
      fontSize: 48,
      color: ColorName.white);
  static TextStyle anyBodyExtraBold48WhiteWithStroke = TextStyle(
      fontFamily: Fonts.anybodyExtraExpandedBold,
      fontSize: 48,
      // color: ColorName.white,
      foreground: Paint()
        ..color = ColorName.white
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke);

  // ***/*****/******/*******/****/***** Monsterrat Fonts ***/*****/*****/*****/*****/****

  static TextStyle montserrat48BoldBlack = const TextStyle(
      fontFamily: Fonts.montserratBold, fontSize: 48, color: ColorName.black);

  static TextStyle montserrat20RegularBlack = const TextStyle(
    fontFamily: Fonts.montserratRegular,
    fontSize: 20,
    color: ColorName.black,
  );

  static TextStyle montserrat20MediumBlack = const TextStyle(
    fontFamily: Fonts.montserratMedium,
    fontSize: 20,
    color: ColorName.textColor,
  );

  static TextStyle montserrat46BoldBlack = const TextStyle(
      fontFamily: Fonts.montserratBold, fontSize: 46, color: ColorName.black);

  static TextStyle montserrat46BoldWhite = const TextStyle(
      fontFamily: Fonts.montserratBold, fontSize: 46, color: ColorName.white);

  static TextStyle montserrat14SemiBoldWhite = const TextStyle(
      fontFamily: Fonts.montserratSemiBold,
      fontSize: 14,
      color: ColorName.white);

  static TextStyle montserrat12Regular = const TextStyle(
      fontFamily: Fonts.montserratRegular,
      fontSize: 12,
      color: ColorName.black);

  static TextStyle montserrat24Regular = const TextStyle(
      fontFamily: Fonts.montserratRegular,
      fontSize: 24,
      color: ColorName.black);

  static TextStyle montserrat30Regular = const TextStyle(
      fontFamily: Fonts.montserratRegular,
      fontSize: 30,
      color: ColorName.black);

  static TextStyle montserrat18BoldBlack = const TextStyle(
      fontFamily: Fonts.montserratBold, fontSize: 18, color: ColorName.black);

  static TextStyle montserrat10WhiteBlack = const TextStyle(
      fontFamily: Fonts.montserratBold, fontSize: 10, color: ColorName.white);

        static TextStyle montserrat20Black = const TextStyle(
      fontFamily: Fonts.montserratRegular, fontSize: 20, color: ColorName.black);

          static TextStyle montserrat20White = const TextStyle(
      fontFamily: Fonts.montserratRegular, fontSize: 20, color: ColorName.white
      );
          
    
}
