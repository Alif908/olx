import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';
import 'package:olx/pages/homepage.dart';
import 'package:olx/pages/otpPage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Login button function
  void loginUser() {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter both fields")));
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpPage(phone: phone, name: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  ImagesCons.loginimg,
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),

              // Input Fields
              Column(
                children: [
                  customTextField(
                    hint: "Name",
                    controller: nameController,
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 20),
                  customTextField(
                    hint: "Phone Number",
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone_android_outlined,
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  SizedBox(
                    width: 180,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: loginUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF61606),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text("---------- or ----------"),
                  const SizedBox(height: 20),

                  // Social Login Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        socialButton(ImagesCons.googleLogo),
                        socialButton(ImagesCons.facebook_logo),
                        socialButton(ImagesCons.ios_logo),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom text field widget
  Widget customTextField({
    required String hint,
    required TextEditingController controller,
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: hint,
        prefixIcon: icon != null ? Icon(icon, color: Colors.grey[700]) : null,
        filled: true,
        fillColor: const Color(0xFFF3F3F3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFA8A8A9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  // Social media button widget
  Widget socialButton(String imagePath) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Login with ${imagePath.split('/').last.split('.').first}",
            ),
          ),
        );
      },
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
