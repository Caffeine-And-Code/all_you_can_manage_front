import 'package:all_you_can_manage/Screens/roles_selector.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:all_you_can_manage/Utilities/storage_manager.dart';
import 'package:all_you_can_manage/route_handler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    StorageManager.clear();
    
    return MaterialApp(
      title: 'All You Can Manage',
      theme: ThemeData(
        colorScheme: ColorsGetter.getColorScheme(),
        useMaterial3: true,
      ),
      home: const RoleSelector(),
      onGenerateRoute: RouteHandler.generateRoute,
    );
  }
}
