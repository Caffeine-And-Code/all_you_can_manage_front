import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:all_you_can_manage/styles/shadow_box.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;
  const SearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.all(30),
        decoration: ShadowBox.getStyle(direction: Direction.down),
        child: TextField(
          style: const TextStyle(fontSize: 22),
          onChanged: onSearch,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
                fontSize: 22,
                color: ColorsGetter.getColor(ColorsNames.secondaryText)),
            prefixIcon: Icon(
              Icons.search,
              color: ColorsGetter.getColor(ColorsNames.secondaryText),
            ),
            filled: true,
            fillColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
          ),
        ),
        
    );
  }
}
