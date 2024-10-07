import 'package:flutter/material.dart';
import 'package:purchase_inventory/custom_widgets/sidebar.dart';
import 'package:purchase_inventory/utlis/routes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> boxContent = [
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Botany',
        'description':
            'Delve into the world of plant science with our collection of botany resources.',
        'route': () => onTapBotany(),
      },
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Zoology',
        'description':
            'Discover animal science with our selection of materials, covering wildlife conservation to animal behavior.',
        'route': () => onTapZoology(),
      },
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Physics',
        'description':
            'Unlock the universe\'s secrets with our physics resources, from quantum mechanics to relativity.',
        'route': () => onTapPhysics(),
      },
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Chemistry',
        'description':
            'Discover matter\'s building blocks with our chemistry resources, from organic chemistry to materials science.',
        'route': () => onTapChemistry(),
      },
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Biotech',
        'description':
            'Explore biology and technology\'s intersection with our resources on genetic engineering, synthetic biology, and more.',
        'route': () => onTapBiotech(),
      },
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Mathematics',
        'description':
            'Unlock problem-solving skills with our math resources, covering algebra, geometry, calculus, and more.',
        'route': () => onTapMaths(),
      },
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Information Technology',
        'description':
            'Explore the world of information technology with our resources on networking, cybersecurity, data analysis, and IT management.',
        'route': () => onTapIT(),
      },
      {
        'image': 'assets/Images/Botany.png',
        'heading': 'Computer Science',
        'description':
            'Dive into computer science with our resources on programming, algorithms, artificial intelligence, and software engineering.',
        'route': () => onTapCS(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xE4181A20),
      body: Row(
        children: [
          Sidebar(screenWidth: screenWidth, screenHeight: screenHeight),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search...',
                          ),
                          cursorColor: const Color(0xFF181A20),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Tooltip(
                        message: 'lucifersushant@gmail.com',
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF181A20),
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/Icons/Profile.png'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: boxContent.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.525,
                      ),
                      itemBuilder: (context, index) {
                        final content = boxContent[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    boxContent[index]['route'](),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF181A20),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      content['image']!,
                                      width: 210,
                                      height: 140,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    content['heading']!,
                                    style: const TextStyle(
                                      color: Color(0xFFD9D9D9),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    content['description']!,
                                    style: const TextStyle(
                                      color: Color(0xFFD9D9D9),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
