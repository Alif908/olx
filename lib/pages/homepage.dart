import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xff235aaa)),
            height: 37,
            width: 500,
          ),

          // SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImagesCons.loginimg, scale: 28),
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.grey),
                      Text(
                        "2H3R+6VC,Kerala 686673,India",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefix: Icon(Icons.search),
              suffix: Icon(Icons.mic, color: Colors.black),
              hint: Text("search"),
            ),
          ),
        ],
      ),
    );
  }
}
