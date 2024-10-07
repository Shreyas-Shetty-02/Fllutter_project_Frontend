import 'package:flutter/material.dart';
import 'package:purchase_inventory/custom_widgets/date_textfield.dart';
import 'package:purchase_inventory/custom_widgets/textfield.dart';

class S extends StatefulWidget {
  const S({super.key});

  @override
  SState createState() => SState();
}

class SState extends State<S> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController totalcostController = TextEditingController();
  final TextEditingController discountedcostController =
      TextEditingController();
  final TextEditingController dateoforderController = TextEditingController();
  final TextEditingController dateofdeliveryController =
      TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  // List to hold the submitted data
  List<List<String>> submittedData = [];

  void _submitData() {
    // Gather data from the text controllers
    List<String> rowData = [
      nameController.text.isNotEmpty ? nameController.text : '-',
      gradeController.text.isNotEmpty ? gradeController.text : '-',
      rateController.text.isNotEmpty ? rateController.text : '-',
      quantityController.text.isNotEmpty ? quantityController.text : '-',
      totalcostController.text.isNotEmpty ? totalcostController.text : '-',
      discountedcostController.text.isNotEmpty
          ? discountedcostController.text
          : '-',
      dateoforderController.text.isNotEmpty ? dateoforderController.text : '-',
      dateofdeliveryController.text.isNotEmpty
          ? dateofdeliveryController.text
          : '-',
      remarkController.text.isNotEmpty ? remarkController.text : '-',
    ];

    // Add the gathered data to the list
    setState(() {
      submittedData.add(rowData);
    });

    // Optionally clear the text fields after submission
    nameController.clear();
    gradeController.clear();
    rateController.clear();
    quantityController.clear();
    totalcostController.clear();
    discountedcostController.clear();
    dateoforderController.clear();
    dateofdeliveryController.clear();
    remarkController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            CustomTextField(
                controller: nameController, labelText: 'Name of Company'),
            const SizedBox(width: 10),
            CustomTextField(controller: gradeController, labelText: 'Grade'),
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
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  backgroundColor: const Color(0xFFFCD535),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 24, color: Color(0xFF181A20)),
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
              borderRadius: BorderRadius.circular(5),
            ),
            columns: const [
              DataColumn(label: Text('Sr. No.')),
              DataColumn(label: Text('Name of Company')),
              DataColumn(label: Text('Grade')),
              DataColumn(label: Text('Rate')),
              DataColumn(label: Text('Quantity')),
              DataColumn(label: Text('Total Cost')),
              DataColumn(label: Text('Discounted Cost')),
              DataColumn(label: Text('Date of Order')),
              DataColumn(label: Text('Date of Delivery')),
              DataColumn(label: Text('Remarks')),
            ],
            rows: List<DataRow>.generate(
              submittedData.length,
              (index) {
                return DataRow(cells: [
                  DataCell(Center(child: Text('${index + 1}'))),
                  DataCell(Center(child: Text(submittedData[index][0]))),
                  DataCell(Center(child: Text(submittedData[index][1]))),
                  DataCell(Center(child: Text(submittedData[index][2]))),
                  DataCell(Center(child: Text(submittedData[index][3]))),
                  DataCell(Center(child: Text(submittedData[index][4]))),
                  DataCell(Center(child: Text(submittedData[index][5]))),
                  DataCell(Center(child: Text(submittedData[index][6]))),
                  DataCell(Center(child: Text(submittedData[index][7]))),
                  DataCell(Center(child: Text(submittedData[index][8]))),
                ]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
