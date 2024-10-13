import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purchase_inventory/custom_widgets/date_textfield.dart';
import 'package:purchase_inventory/custom_widgets/textfield.dart';
import 'package:purchase_inventory/models/api.dart';

class TeachingAidsDataTable extends StatefulWidget {
  final String department;
  const TeachingAidsDataTable({super.key, required this.department});

  @override
  State<TeachingAidsDataTable> createState() => _TeachingAidsDataTableState();
}

class _TeachingAidsDataTableState extends State<TeachingAidsDataTable> {
  String selectedValue = '1';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
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

  Map<String, String> typeMapping = {
    'Audio Aids': 'Audio Aids',
    'Visual Aids': 'Visual Aids',
    'AV Aids': 'AV Aids',
    'Interactive Panels': 'Interactive Panels',
    'Projectors': 'Projectors',
    'Computers': 'Computers',
  };

  void submitData() async {
    if (nameController.text.isEmpty ||
        typeController.text.isEmpty ||
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

    // Map the dropdown value to the corresponding text
    String selectedType = typeMapping[selectedValue] ?? '';

    var result = await APIService().putTeachingAidsDetails(
      nameController.text,
      selectedType, // Use the mapped type text instead of selectedValue
      double.parse(rateController.text),
      int.parse(quantityController.text),
      double.parse(totalcostController.text),
      double.parse(discountedcostController.text),
      DateFormat('dd-MM-yyyy').parse(dateoforderController.text),
      DateFormat('dd-MM-yyyy').parse(dateofdeliveryController.text),
      remarkController.text,
      widget.department,
    );

    if (result == null) {
      Get.snackbar(
        'Error',
        'Fields are invalid.',
        backgroundColor: const Color(0x7EBB2124),
        colorText: Colors.white,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
      return;
    }
    getData();
    // List<String> rowData = [
    //   srNo.toString(),
    //   nameController.text,
    //   typeMapping[selectedValue] ?? '',
    //   rateController.text,
    //   quantityController.text,
    //   totalcostController.text,
    //   discountedcostController.text,
    //   dateoforderController.text,
    //   dateofdeliveryController.text,
    //   remarkController.text,
    //   'Fixed Name',
    // ];

    // setState(() {
    //   submittedData.add(rowData);
    //   srNo++;
    // });

    // Clear the text fields
    nameController.clear();
    typeController.clear();
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
  void getData() async {
    var data =
        await APIService().getDetails(widget.department, "teaching_aids");
    var details = data?["details"];
    List<List<String>> rowData = [];
    for (var detail in details) {
      String dropdownValue = typeMapping.entries
          .firstWhere((entry) => entry.value == detail["type_of_aids"],
              orElse: () => const MapEntry(
                  'Audio Aids', 'Audio Aids')) // default to 'Audio Aids'
          .key;
      rowData.add([
        detail["id"].toString(),
        detail["name"],
        dropdownValue, // Store the dropdown key for proper display in the dropdown
        detail["rate"].toString(),
        detail["quantity"].toString(),
        detail["total_cost"].toString(),
        detail["discounted_cost"].toString(),
        DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(detail["date_of_order"])),
        DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(detail["date_of_delivery"])),
        detail["remarks"],
        detail["ordered_by"]
      ]);
    }
    setState(() {
      submittedData = rowData;
    });
    print(details);
  }

  @override
  void initState() {
    super.initState();
    typeController.text = selectedValue;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            CustomTextField(
                controller: nameController, labelText: 'Name of Aids'),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedValue,
                  decoration: InputDecoration(
                    labelText: 'Type',
                    labelStyle: const TextStyle(
                      color: Color(0x7ED9D9D9),
                      fontWeight: FontWeight.bold,
                    ),
                    filled: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                  dropdownColor: const Color(0xFF181A20),
                  iconEnabledColor: const Color(0xFFD9D9D9),
                  style: const TextStyle(
                    color: Color(0xFFD9D9D9),
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                      typeController.text = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: '1',
                      child: Center(),
                    ),
                    DropdownMenuItem(
                      value: 'Audio Aids',
                      child: Center(child: Text('Audio Aids')),
                    ),
                    DropdownMenuItem(
                      value: 'Visual Aids',
                      child: Center(child: Text('Visual Aids')),
                    ),
                    DropdownMenuItem(
                      value: 'AV Aids',
                      child: Center(child: Text('AV Aids')),
                    ),
                    DropdownMenuItem(
                      value: 'Interactive Panels',
                      child: Center(child: Text('Interactive Panels')),
                    ),
                    DropdownMenuItem(
                      value: 'Projectors',
                      child: Center(child: Text('Projectors')),
                    ),
                    DropdownMenuItem(
                      value: 'Computers',
                      child: Center(child: Text('Computers')),
                    ),
                  ],
                ),
              ),
            ),
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
                  child: Center(child: Text('Sr. No.')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Name of Aids')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Type')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Rate')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Quantity')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Total Cost')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Discounted Cost')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Date of Order')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Date of Delivery')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Remarks')),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(child: Text('Ordered by')),
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
