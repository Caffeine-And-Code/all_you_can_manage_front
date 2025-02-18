import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:all_you_can_manage/styles/elevated_btn_style.dart';
import 'package:flutter/material.dart';
import 'package:all_you_can_manage/Models/Table.dart' as Model;

class TableCard extends StatelessWidget {
  final Model.Table table;
  const TableCard({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedBtnStyle.getStyle(const Size(400, 325)),
      onPressed: () =>
          Navigator.pushNamed(context, "/SingleTable", arguments: table),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center, // Per centrare il testo
              child: Icon(Icons.table_restaurant,
                  size: 100, color: table.getTableColor()),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tavolo ${table.number}",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: ColorsGetter.getColor(
                                ColorsNames.navAndFooterText))),
                    table.getCurrentOrder() != null
                        ? Text(
                            table.getCurrentOrder()!.user.name,
                            style: TextStyle(
                              fontSize: 22,
                              color: ColorsGetter.getColor(
                                  ColorsNames.navAndFooterText),
                            ),
                          )
                        : const SizedBox(),
                    table.calculatePersonsAtTable() > 0
                        ? Column(
                            children: [
                              Text(
                                "Coperti: ${table.calculatePersonsAtTable()}",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: ColorsGetter.getColor(
                                      ColorsNames.navAndFooterText),
                                ),
                              ),
                              Text(
                                "€${table.calculateTotal()}",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: ColorsGetter.getColor(
                                      ColorsNames.navAndFooterText),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
