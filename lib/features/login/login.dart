import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for navigation
import 'package:purchase_inventory/models/api.dart'; // API service for login/signup
import 'package:purchase_inventory/utlis/routes.dart'; // Import routes file

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // State variable to toggle password visibility
  bool _isPasswordVisible = false;

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
            // Left side logo
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
                    child: Image.asset('assets/Images/Login_logo.png',
                        width: 400, height: 400)),
              ),
            ),

            // Right side form
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

                      // Email TextFormField
                      TextFormField(
                        controller: _emailController,
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

                      // Password TextFormField with Obscure Text and Toggle Icon
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: const Color(0xFFD9D9D9),
                        obscureText: !_isPasswordVisible, // Obscure text toggle
                        style: const TextStyle(
                          color: Color(0xFFD9D9D9),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color(0xBED9D9D9),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xBED9D9D9)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFCD535)),
                          ),
                          border: const OutlineInputBorder(),

                          // Show/Hide Password Icon
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xFFD9D9D9),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
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

                      // Log In Button
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
                      const SizedBox(height: 20),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: onTapSignUp,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            backgroundColor: const Color(0xFFFCD535),
                          ),
                          child: const Text(
                            'Sign Up',
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

// Login Button Action
void onTapDashboard() async {
  String email = _emailController.text;
  String password = _passwordController.text;

  APIService apiService = APIService();
  Map<String, dynamic>? result = await apiService.loginUser(email, password);

  if (result != null && result["message"] == "Login successful") {
    Get.snackbar(
      "Login Successful",
      "You have logged in successfully!",
      snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
      backgroundColor: Colors.green, // Success message color
      colorText: Colors.white,
      duration: Duration(seconds: 2), // Duration of snackbar visibility
    );
    Get.offAllNamed(
        MyRoutes.dashboardRoute); // Navigate to dashboard after login
  } else {
    Get.snackbar(
      "Login Failed",
      result?['message'] ?? 'An error occurred',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red, // Failure message color
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }
}
