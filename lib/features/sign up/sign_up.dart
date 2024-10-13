import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:purchase_inventory/models/api.dart';
import 'package:purchase_inventory/utlis/routes.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscurePassword = true; // Add a variable to track password visibility

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                    child: Image.asset('assets/Images/Login_logo.png',
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
                        'Inventory Sign Up',
                        style: TextStyle(
                          fontSize: 68,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFCD535),
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        controller: _nameController,
                        cursorColor: const Color(0xFFD9D9D9),
                        style: const TextStyle(
                          color: Color(0xFFD9D9D9),
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Name',
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
                      // Password field with show/hide functionality
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: const Color(0xFFD9D9D9),
                        obscureText: _obscurePassword, // Toggle obscure text
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
                          // Add the eye icon to toggle password visibility
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFFD9D9D9),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword =
                                    !_obscurePassword; // Toggle obscure text
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: onTapLogin,
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
                      // const SizedBox(height: 30),
                      // // Sign in Button
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     onPressed: onTapLogin,
                      //     style: ElevatedButton.styleFrom(
                      //       padding: const EdgeInsets.symmetric(vertical: 15.0),
                      //       backgroundColor: const Color(0xFFFCD535),
                      //     ),
                      //     child: const Text(
                      //       'Sign In',
                      //       style: TextStyle(
                      //           fontSize: 24,
                      //           fontWeight: FontWeight.w500,
                      //           color: Color(0xFF181A20)),
                      //     ),
                      //   ),
                      // ),
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

  void onTapLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    APIService apiService = APIService();
    Map<String, dynamic>? result =
        await apiService.registerUser(name, email, password);

    if (result != null && result["message"] == "Registered successfully") {
      Get.snackbar(
        "Sign Up Successful",
        "Your account has been registered successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      Get.offAllNamed(MyRoutes
          .loginRoute); // Navigate to dashboard after successful sign-up
    } else {
      Get.snackbar(
        "Sign Up Failed",
        result?['message'] ?? 'An error occurred',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    }
  }
}
