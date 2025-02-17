import 'package:all_you_can_manage/Components/card_container.dart';
import 'package:all_you_can_manage/Components/filter_inline.dart';
import 'package:all_you_can_manage/Components/helmet.dart';
import 'package:all_you_can_manage/Components/table_card.dart';
import 'package:all_you_can_manage/Models/Product.dart';
import 'package:all_you_can_manage/Models/RestaurantSector.dart';
import 'package:all_you_can_manage/Models/Role.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:all_you_can_manage/Models/Table.dart' as Model;

class Tables extends StatefulWidget {
  Tables({super.key, required this.role});

  final Role role;

  //TODO => get the real data from the server
  final List<Model.Table> tables = [
    Model.Table(
        id: 0,
        sector: RestaurantSector(id: 1, name: "Sector 1"),
        status: Model.TableStatus.busy,
        products: [
          Product(id: 1, name: "Product 1", price: 10.0),
          Product(id: 2, name: "Product 2", price: 20.0),
          Product(id: 3, name: "Product 3", price: 30.0),
          Product(id: 3, name: "Coperto", price: 1.0),
        ]),
    Model.Table(
        id: 1,
        status: Model.TableStatus.free,
        sector: RestaurantSector(id: 2, name: "Sector 2"),
        products: []),
    Model.Table(
        id: 2,
        sector: RestaurantSector(id: 2, name: "Sector 2"),
        products: [],
        status: Model.TableStatus.reserved),
  ];

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  onFilter(String filter){
    print(filter);
  }


  late HelmetProps props = HelmetProps(
    role: widget.role,
    type: HelmetType.tables,
    child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: FilterInline(filters: ["Sector 1", "Sector 2"], onFilter: onFilter),
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
