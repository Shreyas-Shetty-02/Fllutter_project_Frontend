import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextField(
      {super.key, required this.controller, required this.labelText});

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45,
        child: TextFormField(
          controller: widget.controller,
          cursorColor: const Color(0xFFD9D9D9),
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: _focusNode.hasFocus
                  ? const Color(0xFFFCD535)
                  : const Color(0x7ED9D9D9),
              fontWeight: FontWeight.bold,
            ),
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x7ED9D9D9)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFCD535)),
            ),
          ),
          style: const TextStyle(
            color: Color(0xFFD9D9D9),
            fontWeight: FontWeight.bold,
          ),
          obscureText: false,
        ),
      ),
    );
  }
}

class CustomAMTTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomAMTTextField(
      {super.key, required this.controller, required this.labelText});

  @override
  CustomAMTTextFieldState createState() => CustomAMTTextFieldState();
}

class CustomAMTTextFieldState extends State<CustomAMTTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45,
        child: TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: _focusNode.hasFocus
                  ? const Color(0xFFFCD535)
                  : const Color(0x7ED9D9D9),
              fontWeight: FontWeight.bold,
            ),
            prefixText: '₹ ',
            prefixStyle: const TextStyle(
              color: Color(0xFFFCD535),
              fontSize: 20,
            ),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x7ED9D9D9)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFCD535)),
            ),
          ),
          style: const TextStyle(
            color: Color(0xFFD9D9D9),
            fontWeight: FontWeight.bold,
          ),
          cursorColor: const Color(0xFFD9D9D9),
        ),
      ),
    );
  }
}
