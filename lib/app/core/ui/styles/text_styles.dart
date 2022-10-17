import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secondaryFont => 'MPlus1P';

  //Primary Font
  TextStyle get textPrimaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: primaryFont);

  TextStyle get textPrimaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: primaryFont);

  TextStyle get textPrimaryFontSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: primaryFont);

  TextStyle get textPrimaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont);

  TextStyle get textPrimaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: primaryFont);

  //Secondary Font
  TextStyle get textSecondaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: secondaryFont);

  TextStyle get textSecondaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: secondaryFont);

  TextStyle get textSecondaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: secondaryFont);

  TextStyle get textSecondaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: secondaryFont);

  TextStyle get labelTextField =>
      textSecondaryFontRegular.copyWith(color: ColorsApp.i.greyDark);

  TextStyle get textSecondaryFontBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(
        color: ColorsApp.i.primary,
      );

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
        color: Colors.white,
        fontSize: 22,
      );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 22,
      );

  TextStyle get titlePrimaryColor => textPrimaryFontBold.copyWith(
        color: ColorsApp.i.primary,
        fontSize: 22,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
