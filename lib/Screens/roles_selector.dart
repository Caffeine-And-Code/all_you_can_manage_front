import 'package:all_you_can_manage/Components/card_container.dart';
import 'package:all_you_can_manage/Components/role_card.dart';
import 'package:all_you_can_manage/Models/Factory/UserFactory.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class RoleSelector extends StatelessWidget {
  RoleSelector({super.key});

  // TODO => delete this fake data and get the real data from the server
  final List<User> roles = [for (int i = 0; i < 15; i++) UserFactory().createUser()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Seleziona il tuo ruolo',
            style: TextStyle(
              color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
          toolbarHeight: 100,
          elevation: 20,
          surfaceTintColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
          shadowColor: Colors.black,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 40),
              child: Image.asset(
                'images/moroLogo.png',
                fit: BoxFit.cover,
                height: 50,
              ),
            )
          ],
        ),
        body: CardContainer(
          mode: CardContainerMode.square250,
          children: roles
              .map((role) => RoleCard(
                    user: role,
                  ))
              .toList(),
        ));
  }
}
