import 'package:all_you_can_manage/Components/card_container.dart';
import 'package:all_you_can_manage/Components/filter_inline.dart';
import 'package:all_you_can_manage/Components/helmet.dart';
import 'package:all_you_can_manage/Components/table_card.dart';
import 'package:all_you_can_manage/Models/Factory/RoomFactory.dart';
import 'package:all_you_can_manage/Models/Factory/TableFactory.dart';
import 'package:all_you_can_manage/Models/Room.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:all_you_can_manage/Models/Table.dart' as Model;

class Tables extends StatefulWidget {
  Tables({super.key, required this.role});

  final User role;

  //TODO => get the real data from the server
  final List<Model.Table> tables = List.generate(15, (index) => TableFactory().createTable());

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  onFilter(Room room){
    print(room.name);
  }


  late HelmetProps props = HelmetProps(
    role: widget.role,
    type: HelmetType.tables,
    child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: FilterInline(filters: RoomFactory.getPresetOfRooms(), onFilter: onFilter),
          automaticallyImplyLeading: false,
          elevation: 4,
          shadowColor: Colors.black,
          backgroundColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
          surfaceTintColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
        ),
        body: CardContainer(
          mode: CardContainerMode.rectangle_w400,
          children:
              widget.tables.map((table) => TableCard(table: table)).toList(),
        )),
  );
  @override
  Widget build(BuildContext context) {
    return Helmet(props: props);
  }
}
