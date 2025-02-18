import 'package:flutter/material.dart';

enum ColorsNames{
  bgDefault,
  navAndFooterBg,
  navAndFooterText,
  primary,
  secondaryText,
  secondaryBg,
}

abstract class ColorsGetter {

  static Map<ColorsNames, String> initializePalette() {
    return {
      ColorsNames.bgDefault: "FFF1E3",
      ColorsNames.navAndFooterBg: "FFFFFF",
      ColorsNames.navAndFooterText: "000000",
      ColorsNames.primary: "FF941D",
      ColorsNames.secondaryText: "989898",
      ColorsNames.secondaryBg: "F5F5F5",
    };
  }

  static Color getColor(ColorsNames key) {
    final pal = initializePalette();
    String val = pal.containsKey(key) ? pal.putIfAbsent(key, () => "") : "";
    if (val != "") {
      final hexValue = int.parse("FF$val", radix: 16);
      Color toRet = Color(hexValue);
      return toRet;
    }

    return Colors.black;
  }

  static ColorScheme getColorScheme() {
    return ColorScheme.fromSwatch().copyWith(
      primary: getColor(ColorsNames.primary),
      secondary: getColor(ColorsNames.navAndFooterBg),
      background: getColor(ColorsNames.bgDefault),
      onBackground: getColor(ColorsNames.navAndFooterText),
      onPrimary: getColor(ColorsNames.navAndFooterText),
    );
  }
}
