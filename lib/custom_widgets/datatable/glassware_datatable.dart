import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase_inventory/custom_widgets/date_textfield.dart';
import 'package:purchase_inventory/custom_widgets/textfield.dart';

class GlasswareDataTable extends StatefulWidget {
  const GlasswareDataTable({super.key});

  @override
  State<GlasswareDataTable> createState() => _GlasswareDataTableState();
}

class _GlasswareDataTableState extends State<GlasswareDataTable> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController totalcostController = TextEditingController();
  final TextEditingController discountedcostController =
      TextEditingController();
  final TextEditingController dateoforderController = TextEditingController();
  final TextEditingController dateofdeliveryController =
      TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  List<List<String>> submittedData = [];

  int srNo = 1;

  void submitData() {
    if (nameController.text.isEmpty ||
        capacityController.text.isEmpty ||
        rateController.text.isEmpty ||
        quantityController.text.isEmpty ||
        totalcostController.text.isEmpty ||
        discountedcostController.text.isEmpty ||
        dateoforderController.text.isEmpty ||
        dateofdeliveryController.text.isEmpty ||
        remarkController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill out all required fields.',
        backgroundColor: const Color(0x7EBB2124),
        colorText: Colors.white,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
      return;
    }

    List<String> rowData = [
      srNo.toString(),
      nameController.text,
      capacityController.text,
      rateController.text,
      quantityController.text,
      totalcostController.text,
      discountedcostController.text,
      dateoforderController.text,
      dateofdeliveryController.text,
      remarkController.text,
      'Fixed Name',
    ];

    setState(() {
      submittedData.add(rowData);
      srNo++;
    });

    nameController.clear();
    capacityController.clear();
    rateController.clear();
    quantityController.clear();
    totalcostController.clear();
    discountedcostController.clear();
    dateoforderController.clear();
    dateofdeliveryController.clear();
    remarkController.clear();
    Get.snackbar(
      'Success',
      'Your entry has been submitted.',
      backgroundColor: const Color(0x7E22BB33),
      colorText: Colors.white,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
    );
  }

  void exportData() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            CustomTextField(
                controller: nameController, labelText: 'Name of Glassware'),
            const SizedBox(width: 10),
            CustomTextField(
                controller: capacityController, labelText: 'Capacity'),
            const SizedBox(width: 10),
            CustomAMTTextField(controller: rateController, labelText: 'Rate'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            CustomTextField(
                controller: quantityController, labelText: 'Quantity'),
            const SizedBox(width: 10),
            CustomAMTTextField(
                controller: totalcostController, labelText: 'Total Cost'),
            const SizedBox(width: 10),
            CustomAMTTextField(
                controller: discountedcostController,
                labelText: 'Discounted Cost'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            DateField(
                controller: dateoforderController, labelText: 'Date of Order'),
            const SizedBox(width: 10),
            DateField(
                controller: dateofdeliveryController,
                labelText: 'Date of Delivery'),
            const SizedBox(width: 10),
            CustomTextField(controller: remarkController, labelText: 'Remarks'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: submitData,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(WidgetState.hovered)) {
                        return const Color(0xFFFCD535);
                      }
                      return Colors.transparent;
                    },
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(WidgetState.hovered)) {
                        return const Color(0xFF181A20);
                      }
                      return const Color(0xFFD9D9D9);
                    },
                  ),
                  side: WidgetStateProperty.resolveWith<BorderSide?>(
                    (states) {
                      return const BorderSide(
                        color: Color(0x7ED9D9D9),
                        width: 1.0,
                      );
                    },
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: exportData,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(WidgetState.hovered)) {
                        return const Color(0xFF107C41);
                      }
                      return Colors.transparent;
                    },
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(WidgetState.hovered)) {
                        return const Color(0xFF181A20);
                      }
                      return const Color(0xFFD9D9D9);
                    },
                  ),
                  side: WidgetStateProperty.resolveWith<BorderSide?>(
                    (states) {
                      if (states.contains(WidgetState.hovered)) {
                        return const BorderSide(
                          color: Color(0xFF107C41),
                          width: 1.0,
                        );
                      }
                      return const BorderSide(
                        color: Color(0x7ED9D9D9),
                        width: 1.0,
                      );
                    },
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  'Export to Excel',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 30,
            dataRowColor: WidgetStateProperty.all(const Color(0x3E181A20)),
            headingRowColor: WidgetStateProperty.all(const Color(0xFF181A20)),
            dividerThickness: 1.0,
            headingTextStyle: const TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 16,
            ),
            dataTextStyle: const TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            border: TableBorder(
              top: const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
              bottom: const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
              left: const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
              right: const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
              horizontalInside:
                  const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
              verticalInside:
                  const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            columns: const [
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Sr. No.')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Name of Glassware')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Capacity')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Rate')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Quantity')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Total Cost')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Discounted Cost')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Date of Order')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Date of Delivery')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Remarks')]),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Ordered by')]),
                ),
              ),
            ],
            rows: submittedData.map((data) {
              return DataRow(cells: [
                DataCell(Center(child: Text(data[0]))),
                DataCell(Center(child: Text(data[1]))),
                DataCell(Center(child: Text(data[2]))),
                DataCell(Center(child: Text('₹ ${data[3]}'))),
                DataCell(Center(child: Text(data[4]))),
                DataCell(Center(child: Text('₹ ${data[5]}'))),
                DataCell(Center(child: Text('₹ ${data[6]}'))),
                DataCell(Center(child: Text(data[7]))),
                DataCell(Center(child: Text(data[8]))),
                DataCell(Center(child: Text(data[9]))),
                DataCell(Center(child: Text(data[10]))),
              ]);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
