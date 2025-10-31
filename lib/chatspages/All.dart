import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.values.last,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(),
              child: Image.asset(ImagesCons.notavailable),
            ),
          ),
        ],
      ),
    );
  }
}
