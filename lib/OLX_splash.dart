import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/home.dart';
import 'package:olx/images/images_cons.dart';
import 'package:olx/login%20page/login.dart';

class OlxSplash extends StatefulWidget {
  const OlxSplash({super.key});

  @override
  State<OlxSplash> createState() => _OlxSplashState();
}

class _OlxSplashState extends State<OlxSplash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0078FA),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(height: 800, child: Image.asset(ImagesCons.splash)),
                Container(
                  child: Text(
                    "India's leading market place",
                    style: TextStyle(color: Color(0xffFFFEFF)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
