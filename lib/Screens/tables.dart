import 'package:all_you_can_manage/Components/card_container.dart';
import 'package:all_you_can_manage/Components/filter_inline.dart';
import 'package:all_you_can_manage/Components/helmet.dart';
import 'package:all_you_can_manage/Components/loading_grid.dart';
import 'package:all_you_can_manage/Components/secondary_app_bar.dart';
import 'package:all_you_can_manage/Components/table_card.dart';
import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/Room.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:all_you_can_manage/config/system_variables.dart';
import 'package:flutter/material.dart';
import 'package:all_you_can_manage/Models/Table.dart' as Model;

class Tables extends StatefulWidget {
  const Tables({super.key, required this.role});

  final User role;

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  //TODO => get the real data from the server
  List<Model.Table> tables = List.empty();
  List<Room> rooms = List.empty(growable: true);
  bool isLoading = true;

  List<Model.Table> filteredTables = List.empty();

  @override
  void initState() {
    super.initState();
    filteredTables = tables;
    loadTables();
  }

  onFilter(Room room) {
    setState(() {
      if (room.id == -1) {
        filteredTables = tables;
      } else {
        filteredTables =
            tables.where((table) => table.room.equals(room)).toList();
      }
      filteredTables.sort((a, b) => a.number.compareTo(b.number));
    });
  }

  loadTables() async {
    // simulate a delay
    await Future.delayed(Duration(seconds: 2));
    if (SystemVariables.isDebug()) {
      tables = Factory.getPresetOfTables();
      rooms = Factory.getPresetOfRooms();
    } else {
      //TODO => get the real data from the server
    }
    onFilter(Room.empty());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Helmet(
        props: HelmetProps(
            role: widget.role,
            type: HelmetType.tables,
            child: SecondaryAppBar(
              backgroundColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
                appBar: FilterInline(filters: rooms, onFilter: onFilter),
                body: isLoading
                    ? LoadingGrid(
                        loading: isLoading,
                        length: 8,
                        mode: CardContainerMode.rectangle_w400,
                        singleLoadingElement:
                            TableCard(table: Model.Table.empty()))
                    : CardContainer(
                        mode: CardContainerMode.rectangle_w400,
                        children: filteredTables
                            .map((table) => TableCard(table: table))
                            .toList(),
                      ))));
  }
}
