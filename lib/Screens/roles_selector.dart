import 'package:all_you_can_manage/Components/card_container.dart';
import 'package:all_you_can_manage/Components/role_card.dart';
import 'package:all_you_can_manage/Models/Role.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class RoleSelector extends StatelessWidget {
  RoleSelector({super.key});

  // TODO => delete this fake data and get the real data from the server
  final List<Role> roles = [
    Role(
        id: 1,
        name: "Cassa",
        icon: Icon(
          Icons.account_balance_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 2,
        name: "Cameriere 1",
        icon: Icon(Icons.person_outline_outlined,
            size: 100,
            color: ColorsGetter.getColor(ColorsNames.navAndFooterText))),
    Role(
        id: 3,
        name: "Commis 1",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 3,
        name: "Commis 2",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 3,
        name: "Commis 3",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 3,
        name: "Commis 4",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 3,
        name: "Commis 4",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 3,
        name: "Commis 4",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 3,
        name: "Commis 4",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
    Role(
        id: 3,
        name: "Commis 4",
        icon: Icon(
          Icons.person_3_outlined,
          size: 100,
          color: ColorsGetter.getColor(ColorsNames.navAndFooterText),
        )),
  ];

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
          mode: CardContainerMode.square200,
          children: roles
              .map((role) => RoleCard(
                    role: role,
                  ))
              .toList(),
        ));
  }
}
