import 'package:flutter/material.dart';

class CategoryButtonRow extends StatefulWidget {
  final int selectedTableIndex;
  final Function(int) onButtonPressed;

  const CategoryButtonRow({
    super.key,
    required this.selectedTableIndex,
    required this.onButtonPressed,
  });

  @override
  CategoryButtonRowState createState() => CategoryButtonRowState();
}

class CategoryButtonRowState extends State<CategoryButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildButton(context, 'Chemicals', 0),
        const SizedBox(width: 10),
        buildButton(context, 'Instrument', 1),
        const SizedBox(width: 10),
        buildButton(context, 'Glassware', 2),
        const SizedBox(width: 10),
        buildButton(context, 'Software', 3),
        const SizedBox(width: 10),
        buildButton(context, 'Teaching Aids', 4),
      ],
    );
  }

  ElevatedButton buildButton(BuildContext context, String text, int index) {
    bool isSelected = widget.selectedTableIndex == index;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor:
            isSelected ? const Color(0xFFD9D9D9) : const Color(0xFF181A20),
      ),
      onPressed: () {
        widget.onButtonPressed(index);
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: isSelected ? const Color(0xFF181A20) : const Color(0xFFD9D9D9),
        ),
      ),
    );
  }
}
