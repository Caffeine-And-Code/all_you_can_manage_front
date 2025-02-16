import 'package:all_you_can_manage/Models/Role.dart';
import 'package:all_you_can_manage/Screens/login.dart';
import 'package:all_you_can_manage/Screens/roles_selector.dart';
import 'package:all_you_can_manage/Screens/tables.dart';
import 'package:all_you_can_manage/Utilities/storage_manager.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  // static Future<Route<dynamic>> checkLoggedIn(MaterialPageRoute toRet) async{
  //   // TODO: Implement this when the login in the backend is implemented
  //   await StorageManager.saveKey("token", "DEBUGTOKEN");
  //   return StorageManager.getKey("token").then((value) {
  //     if (value == null) {
  //       return MaterialPageRoute(builder: (_) => const Login());
  //     }else{
  //       return toRet;
  //     }
  //   });
  // }


  // Navigator.pushNamed(context, "/Example", arguments: null);
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => RoleSelector());

      case "/Login":
        return MaterialPageRoute(builder: (_) => const Login());

      case "/Tables":
        Role role = settings.arguments as Role;
        return MaterialPageRoute(builder: (_) => Tables(role: role,));

      default:
        return _errorRoute();
    }
  }
}
