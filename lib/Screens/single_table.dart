import 'package:all_you_can_manage/Components/helmet.dart';
import 'package:all_you_can_manage/Models/Role.dart';
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

    late Role role; // Dichiarata senza inizializzazione immediata
  bool isLoading = true; // Stato per gestire il caricamento

  @override
  void initState() {
    super.initState();
    _loadRole();
  }

  Future<void> _loadRole() async {
    String? value = await StorageManager.getKey("role");
    setState(() {
      if (value != null) {
        role = Role.fromJsonString(value);
      } else {
        role = Role(id: -1, name: "Unknown", icon: const Icon(Icons.error));
      }
      isLoading = false; // Il caricamento è completato
    });
  }


  @override
  Widget build(BuildContext context) {
    //wait for the data to be loaded from the storage
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: ColorsGetter.getColor(ColorsNames.primary),)); 
    }

    return Helmet(
        props: HelmetProps(
            role: role,
            type: HelmetType.tables,
            child:  Center(
                child: Column(
                  children: [
                    Text("Table ${widget.table.id}"),
                    Text("Status: ${widget.table.status}"),
                    Text("Sector: ${widget.table.sector.name}"),
                    Text("Total: ${widget.table.calculateTotal()}"),
                    Text(
                        "Persons at table: ${widget.table.calculatePersonsAtTable()}"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Go back!'),
                    ),
                  ],
                ),
              ),
            ));
  }
}
