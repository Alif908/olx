import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/OLX_splash.dart';
import 'package:olx/home.dart';

void main(List<String> args) {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OlxSplash(), debugShowCheckedModeBanner: false);
  }
}
