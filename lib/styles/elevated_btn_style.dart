import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class ElevatedBtnStyle{
  static ButtonStyle getStyle(Size size){
    return ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
      fixedSize: MaterialStateProperty.all(size),
      minimumSize: MaterialStateProperty.all(size),
      maximumSize: MaterialStateProperty.all(size),
      backgroundColor: MaterialStateProperty.all(
          ColorsGetter.getColor(ColorsNames.navAndFooterBg)),
      surfaceTintColor: MaterialStateProperty.all(
          ColorsGetter.getColor(ColorsNames.navAndFooterBg)),
      elevation: MaterialStateProperty.all(5),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      )),
    );
  }
}
