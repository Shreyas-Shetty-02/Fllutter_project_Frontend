import 'package:flutter/material.dart';
import 'package:purchase_inventory/utlis/routes.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 1.5 / 4,
              height: screenHeight * 0.85,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 1.0,
                  ),
                ),
              ),
              child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/Images/ForgetPassword_logo.png',
                        width: 400, height: 400)),
              ),
            ),
            SizedBox(
              width: screenWidth * 2.5 / 4,
              height: screenHeight,
              child: Center(
                child: Container(
                  width: screenWidth * 1.75 / 4,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Inventory',
                        style: TextStyle(
                          fontSize: 68,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFCD535),
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        cursorColor: const Color(0xFFD9D9D9),
                        style: const TextStyle(
                          color: Color(0xFFD9D9D9),
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color(0xBED9D9D9),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xBED9D9D9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFCD535)),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        cursorColor: const Color(0xFFD9D9D9),
                        style: const TextStyle(
                          color: Color(0xFFD9D9D9),
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color(0xBED9D9D9),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xBED9D9D9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFCD535)),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              overlayColor: Colors.transparent,
                            ),
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFFCD535),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: onTapDashboard,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            backgroundColor: const Color(0xFFFCD535),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF181A20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
