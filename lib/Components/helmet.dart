import 'package:all_you_can_manage/Models/Role.dart';
import 'package:flutter/material.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';

class Helmet extends StatelessWidget {
  const Helmet({super.key, required this.props});

  final HelmetProps props;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 52,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                props.role.icon.icon,
                size: 35,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  props.role.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          elevation: 4,
          shadowColor: Colors.black,
          backgroundColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
          surfaceTintColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 40),
              child: Image.asset(
                'images/moroLogo.png',
                fit: BoxFit.cover,
                height: 30,
              ),
            )
          ],
        ),
        body: Center(child: props.child),
        bottomNavigationBar:  Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.35), // Colore dell'ombra
          blurRadius: 16, // Sfocatura
          offset:const Offset(0, -4), // Ombra verso l'alto
        ),
      ],
    ),
    child: BottomNavigationBar(
            elevation: 4,
            iconSize: 60,
            backgroundColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.table_restaurant),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              )
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: ColorsGetter.getColor(ColorsNames.primary),
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/Tables',
                      arguments: props.role);
                  break;
                case 1:
                  print("Take Away");
                  break;
                case 2:
                  Navigator.pushNamed(context, '/');
                  break;
              }
            },
          ),
        ));
  }
}

class HelmetProps {
  late Role role;
  late HelmetType type;
  late Widget? child;

  HelmetProps({
    required this.role,
    required this.type,
    this.child,
  });
}

enum HelmetType {
  tables,
  takeAway,
  settings,
}
