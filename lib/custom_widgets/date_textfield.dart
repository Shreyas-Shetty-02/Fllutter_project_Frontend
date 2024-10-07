import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  const DateField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  DateFieldState createState() => DateFieldState();
}

class DateFieldState extends State<DateField> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF181A20),
              onPrimary: Color(0xFFD9D9D9),
              onSurface: Color(0xFF181A20),
              surface: Color(0xFFD9D9D9),
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat('dd-MM-yyyy').format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _selectDate(context);
        },
        child: TextSelectionTheme(
          data: const TextSelectionThemeData(
            selectionColor: Color(0x33000000),
          ),
          child: AbsorbPointer(
            child: TextField(
              controller: widget.controller,
              cursorColor: const Color(0xBE000000),
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Color(0x7ED9D9D9),
                  fontWeight: FontWeight.bold,
                ),
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF000000)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 7.5,
                ),
              ),
              style: const TextStyle(
                color: Color(0xFFD9D9D9),
                fontWeight: FontWeight.bold,
              ),
              obscureText: false,
            ),
          ),
        ),
      ),
    );
  }
}
