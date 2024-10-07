import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            fontFamily: 'Aquatico',
            color: Color(0xFFFCD535),
          ),
        ),
        const SizedBox(width: 20),
        const Tooltip(
          message: 'lucifersushant@gmail.com',
          child: CircleAvatar(
            backgroundColor: Color(0xFF181A20),
            radius: 25,
            backgroundImage: AssetImage('assets/Icons/Profile.png'),
          ),
        ),
      ],
    );
  }
}
