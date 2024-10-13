import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:purchase_inventory/utlis/routes.dart';

class Sidebar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  Sidebar({super.key, required this.screenWidth, required this.screenHeight});

  final List<Map<String, dynamic>> dropdownItems = [
    {'text': 'Botany', 'route': () => onTapBotany()},
    {'text': 'Zoology', 'route': () => onTapZoology()},
    {'text': 'Physics', 'route': () => onTapPhysics()},
    {'text': 'Chemistry', 'route': () => onTapChemistry()},
    {'text': 'Biotechnology', 'route': () => onTapBiotech()},
    {'text': 'Mathematics', 'route': () => onTapMaths()},
    {'text': 'Information Technology', 'route': () => onTapIT()},
    {'text': 'Computer Science', 'route': () => onTapCS()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.225,
      height: screenHeight,
      color: const Color(0xFF181A20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: GestureDetector(
                  onTap: onTapDashboard,
                  child: const Text(
                    'Inventory',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Aquatico',
                      color: Color(0xFFFCD535),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Department.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 10),
                      PopupMenuButton<int>(
                        offset: const Offset(0, 50),
                        elevation: 0,
                        onSelected: (index) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  dropdownItems[index]['route'](),
                            ),
                          );
                        },
                        color: const Color(0xFF181A20),
                        itemBuilder: (context) => List.generate(
                          dropdownItems.length,
                          (index) => PopupMenuItem(
                            height: 30,
                            value: index,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        dropdownItems[index]['route'](),
                                  ),
                                );
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              overlayColor: WidgetStateProperty.all<Color>(
                                  Colors.transparent),
                              child: Text(
                                dropdownItems[index]['text'],
                                style: const TextStyle(
                                  color: Color(0xFFD9D9D9),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Department",
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Image.asset(
                    'assets/Icons/SignOut.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                  TextButton(
                    onPressed: () async {
                      const storage = FlutterSecureStorage();
                      await storage.delete(key: "email");
                      await storage.delete(key: "password");
                      onTapLogin();
                    },
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFFD9D9D9),
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
}
