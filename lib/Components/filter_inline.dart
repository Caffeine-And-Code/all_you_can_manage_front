import 'package:all_you_can_manage/Models/Room.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class FilterInline extends StatefulWidget {
  final List<Room> filters;
  final Function(Room) onFilter;
  FilterInline({super.key, required this.filters, required this.onFilter}) {
    if(!filters.contains(Room(id: -1, name: "Tutti"))){
      filters.insert(0, Room(id: -1, name: "Tutti"));
    }
  }
  @override
  State<FilterInline> createState() => _FilterInlineState();
}

class _FilterInlineState extends State<FilterInline> {
  late Room currentFilter;
  //init state for the filter
  @override
  void initState() {
    super.initState();
    currentFilter = widget.filters[0];
  }

  void onPressed(Room filter) {
    widget.onFilter(filter);
    super.setState(() {
      currentFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      children: widget.filters
          .map((filter) => TextButton(
                onPressed: () => onPressed(filter),
                style: ButtonStyle(
                  alignment: Alignment.topCenter,
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.only(
                          top: 8, bottom: 8, right: 10, left: 10)),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(120, 45)),
                  maximumSize:
                      MaterialStateProperty.all<Size>(const Size(160, 45)),
                  backgroundColor: MaterialStateProperty.all<Color>(filter
                          .equals(currentFilter)
                      ? ColorsGetter.getColor(ColorsNames.primary)
                      : (ColorsGetter.getColor(ColorsNames.navAndFooterBg))),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0))),
                ),
                child: Text(
                  filter.name,
                  style: TextStyle(
                      fontSize: 22,
                      color: filter.equals(currentFilter)
                          ? ColorsGetter.getColor(ColorsNames.navAndFooterBg)
                          : (ColorsGetter.getColor(
                              ColorsNames.navAndFooterText))),
                ),
              ))
          .toList(),
    );
  }
}
