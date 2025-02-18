import 'package:flutter/material.dart';

class TableManagePanel extends StatefulWidget {
  const TableManagePanel({super.key});

  @override
  State<TableManagePanel> createState() => _TableManagePanelState();
}

class _TableManagePanelState extends State<TableManagePanel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4, // Occupa il 40% dello schermo
      child: Container(
        color: Colors.red,
        child: const Center(
          child: Text(
            "Pannello 40%",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
