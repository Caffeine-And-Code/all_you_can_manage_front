import 'dart:convert';

import 'package:all_you_can_manage/Utilities/storage_manager.dart';
import 'package:all_you_can_manage/styles/elevated_btn_style.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key, required this.user});

  final User user;

  saveRole(BuildContext context) {
    StorageManager.saveKey("role", jsonEncode(user.toJson())).whenComplete(
        () => Navigator.pushNamed(context, "/Tables", arguments: user));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedBtnStyle.getStyle(const Size(200, 200)),
      onPressed: () => saveRole(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          user.role.getIcon(),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
            ),
          ),
        ],
      ),
    );
  }
}
