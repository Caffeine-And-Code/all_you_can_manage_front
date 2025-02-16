import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';

class FilterInline extends StatefulWidget {
  final List<String> filters;
  final Function(String) onFilter;
  FilterInline({super.key, required this.filters, required this.onFilter}) {
    filters.insert(0, "Tutti");
  }
  late String currentFilter;
  @override
  State<FilterInline> createState() => _FilterInlineState();
}

class _FilterInlineState extends State<FilterInline> {
  //init state for the filter
  @override
  void initState() {
    super.initState();
    widget.currentFilter = "Tutti";
  }

  void onPressed(String filter) {
    widget.onFilter(filter);
    super.setState(() {
      widget.currentFilter = filter;
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
                  backgroundColor: MaterialStateProperty.all<Color>(filter ==
                          widget.currentFilter
                      ? ColorsGetter.getColor(ColorsNames.primary)
                      : (ColorsGetter.getColor(ColorsNames.navAndFooterBg))),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0))),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                      fontSize: 22,
                      color: filter == widget.currentFilter
                          ? ColorsGetter.getColor(ColorsNames.navAndFooterBg)
                          : (ColorsGetter.getColor(
                              ColorsNames.navAndFooterText))),
                ),
              ))
          .toList(),
    );
  }
}
