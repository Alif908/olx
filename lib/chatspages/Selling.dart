import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';

class Selling extends StatefulWidget {
  const Selling({super.key});

  @override
  State<Selling> createState() => _SellingState();
}

class _SellingState extends State<Selling> {
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
