import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Screens/login.dart';
import 'package:all_you_can_manage/Screens/roles_selector.dart';
import 'package:all_you_can_manage/Screens/single_table.dart';
import 'package:all_you_can_manage/Screens/tables.dart';
import 'package:all_you_can_manage/Models/Table.dart' as Model;
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text('Error: $message'),
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
        User user = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => Tables(role: user,));
      
      case "/SingleTable":
        var args = settings.arguments;
        if (args != null && args is Model.Table) {
          Model.Table table = args;
          return MaterialPageRoute(builder: (_) => SingleTable(table: table));
        } else {
          return _errorRoute('The arguments are not correct! passed $args');
        }

      default:
        return _errorRoute('Wrong Route!');
    }
  }
}
