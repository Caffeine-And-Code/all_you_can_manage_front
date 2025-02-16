import 'package:all_you_can_manage/styles/elevated_btn_style.dart';
import 'package:all_you_can_manage/Models/Role.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key, required this.role});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedBtnStyle.getStyle(const Size(100, 100)),
        onPressed: ()=>Navigator.pushNamed(context, "/Tables",arguments: role),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              role.icon,
              Text(role.name,style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
              ),),
            ],
          ),
        );
  }
}
