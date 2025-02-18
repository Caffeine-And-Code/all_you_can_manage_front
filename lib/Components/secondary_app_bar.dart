import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class SecondaryAppBar extends StatelessWidget {
  final Widget appBar;
  final Widget body;
  final double toolbarHeight;
  final Color backgroundColor;
  const SecondaryAppBar({super.key, required this.appBar, required this.body, this.toolbarHeight = 60,required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        title: appBar,
        automaticallyImplyLeading: false,
        elevation: 4,
        shadowColor: Colors.black,
        backgroundColor: backgroundColor,
        surfaceTintColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
      ),
      body: body,
    );
  }
}
