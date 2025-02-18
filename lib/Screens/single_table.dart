import 'package:all_you_can_manage/Components/helmet.dart';
import 'package:all_you_can_manage/Components/search_product_panel.dart';
import 'package:all_you_can_manage/Components/table_manage_panel.dart';
import 'package:all_you_can_manage/Models/User.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:all_you_can_manage/Utilities/storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:all_you_can_manage/Models/Table.dart' as Model;

class SingleTable extends StatefulWidget {
  final Model.Table table;
  const SingleTable({super.key, required this.table});
  
  @override
  State<SingleTable> createState() => _SingleTableState();
}

class _SingleTableState extends State<SingleTable> {

  late User role; 
  bool isLoading = true; 

  Future<void> _loadRole() async {
    String? roleString = await StorageManager.getKey("role");
    
    setState(() {
      if (roleString != null) {
        role = User.fromJsonString(roleString);
      } else {
        // Se non è stato trovato alcun ruolo, l'utente viene reindirizzato alla pagina di scelta del ruolo
        Navigator.pushNamed(context, "/");
      }
      isLoading = false; // Il caricamento è completato
    });
  }


  @override
  Widget build(BuildContext context) {
    //wait for the data to be loaded from the storage
    if (isLoading) {
      _loadRole();
      return Center(child: CircularProgressIndicator(color: ColorsGetter.getColor(ColorsNames.primary),)); 
    }

    return Helmet(
        props: HelmetProps(
            role: role,
            type: HelmetType.tables,
            child:  const Center(
                child: Row(
                  children: [
                    SearchProductPanel(),
                    TableManagePanel(),
                  ],
                ),
              ),
            ));
  }
}
