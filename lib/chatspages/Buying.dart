import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';

class Buying extends StatefulWidget {
  const Buying({super.key});

  @override
  State<Buying> createState() => _BuyingState();
}

class _BuyingState extends State<Buying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffffffff),
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
      ),);
  }
}
