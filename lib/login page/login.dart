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
        builder: (context) => OtpPage(phone: phone,name:name),
        // HomePage(name: name, phone: phone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(100),
                child: Container(child: Image.asset(ImagesCons.loginimg)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 20,
                  children: [
                    customtext(hint: "Name", controller: nameController),
                    customtext(
                      hint: "phone Number",
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: loginUser,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 246, 22, 6),
                          borderRadius: BorderRadius.circular(
                            30,
                          ), // makes it pill-shaped
                        ),
                        alignment: Alignment.center, // centers the text
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

                    Container(child: Text("----------or-----------")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Row(
                        spacing: 20,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                ImagesCons.googleLogo,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                ImagesCons.facebook_logo,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(ImagesCons.ios_logo),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField customtext({
    required String hint,
    IconData? icon,
    Widget? suffixIcon,
    TextEditingController? controller,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        label: Text(hint),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 243, 243),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xffA8A8A9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        prefixIcon: Icon(icon, size: 24, color: Color(0xff626262)),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
