import 'package:all_you_can_manage/Components/card_container.dart';
import 'package:all_you_can_manage/Components/loading_grid.dart';
import 'package:all_you_can_manage/Components/role_card.dart';
import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:all_you_can_manage/config/system_variables.dart';
import 'package:flutter/material.dart';

class RoleSelector extends StatefulWidget {
  const RoleSelector({super.key});

  @override
  State<RoleSelector> createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  late List<User> users;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    users = List.empty();
    loadUsers();
  }

  loadUsers() async {
    // simulate a delay
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      if (SystemVariables.isDebug()) {
        users = Factory.getPresetOfUsers();
      } else {
        // TODO => add the getter for the real data from the server
      }
      isLoading = false;
    });
  }

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
        body: isLoading
            ? LoadingGrid(
                loading: isLoading,
                length: 10,
                mode: CardContainerMode.square250,
                singleLoadingElement: RoleCard(user: User.empty()))
            : CardContainer(
                mode: CardContainerMode.square250,
                children: users
                    .map((role) => RoleCard(
                          user: role,
                        ))
                    .toList(),
              ));
  }
}
