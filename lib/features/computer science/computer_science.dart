import 'package:flutter/material.dart';
import 'package:purchase_inventory/custom_widgets/appbar.dart';
import 'package:purchase_inventory/custom_widgets/sidebar.dart';
import 'package:purchase_inventory/custom_widgets/datatable/category_button_row.dart';
import 'package:purchase_inventory/custom_widgets/datatable/chemical_datatable.dart';
import 'package:purchase_inventory/custom_widgets/datatable/glassware_datatable.dart';
import 'package:purchase_inventory/custom_widgets/datatable/instrument_datatable.dart';
import 'package:purchase_inventory/custom_widgets/datatable/software_datatable.dart';
import 'package:purchase_inventory/custom_widgets/datatable/teaching_aids_datatable.dart';

class CS extends StatefulWidget {
  const CS({super.key});

  @override
  State<CS> createState() => _CSState();
}

class _CSState extends State<CS> {
  int selectedTableIndex = 0;
  String? selectedGrade;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xE4181A20),
      body: Row(
        children: [
          Sidebar(screenWidth: screenWidth, screenHeight: screenHeight),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(title: 'Computer Science'),
                  const SizedBox(height: 20),
                  CategoryButtonRow(
                    selectedTableIndex: selectedTableIndex,
                    onButtonPressed: (int index) {
                      setState(() {
                        selectedTableIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: _buildSelectedDataTable(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedDataTable() {
    switch (selectedTableIndex) {
      case 0:
        return const ChemicalDataTable();
      case 1:
        return const InstrumentDataTable();
      case 2:
        return const GlasswareDataTable();
      case 3:
        return const SoftwareDataTable();
      case 4:
        return const TeachingAidsDataTable();
      default:
        return const ChemicalDataTable();
    }
  }
}
