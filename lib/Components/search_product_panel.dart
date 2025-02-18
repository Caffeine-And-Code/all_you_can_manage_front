import 'package:all_you_can_manage/Components/secondary_app_bar.dart';
import 'package:all_you_can_manage/Models/Factory/Factory.dart';
import 'package:all_you_can_manage/Models/Product.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:all_you_can_manage/config/system_variables.dart';
import 'search_bar.dart' as search;
import 'package:flutter/material.dart';

class SearchProductPanel extends StatefulWidget {
  const SearchProductPanel({super.key});

  @override
  State<SearchProductPanel> createState() => _SearchProductPanelState();
}

class _SearchProductPanelState extends State<SearchProductPanel> {
  List<Product> products = List.empty();
  List<Product> filteredProducts = List.empty();
  bool isLoading = true;

  onSearch(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  //TODO => evaluate if it's better to fetch products from the server here
  // or save it in the StorageManager in the tables page and just get it here
  fetchProducts() async {
    setState(() {
      if (SystemVariables.isDebug()) {
        products = Factory.getPresetOfProducts();
      } else {
        //TODO => fetch products from the server
      }
      filteredProducts = products;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6, // Occupa il 60% dello schermo
        child: SecondaryAppBar(
          backgroundColor: ColorsGetter.getColor(ColorsNames.secondaryBg),
            toolbarHeight: 80,
            appBar: search.SearchBar(
              onSearch: onSearch,
            ),
            body: SecondaryAppBar(backgroundColor:ColorsGetter.getColor(ColorsNames.navAndFooterBg),appBar: Placeholder(), body: Placeholder())));
  }
}
