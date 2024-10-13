import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  Future<String?> _getEmail() async {
    const storage = FlutterSecureStorage();
    return storage.read(key: "email");
  }

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
        FutureBuilder<String?>(
          future: _getEmail(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            String message = snapshot.connectionState == ConnectionState.waiting
                ? 'Loading...'
                : snapshot.data ?? 'No email found';

            return Tooltip(
              message: message,
              child: const CircleAvatar(
                backgroundColor: Color(0xFF181A20),
                radius: 25,
                backgroundImage: AssetImage('assets/Icons/Profile.png'),
              ),
            );
          },
        )
      ],
    );
  }
}
