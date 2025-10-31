import 'package:flutter/material.dart';
import 'package:olx/chatspages/All.dart';
import 'package:olx/images/images_cons.dart';
import 'package:olx/parts/top_bar.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topbar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "My Ads",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
          ),
          SizedBox(height: 300),
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Column(children: [Image.asset(ImagesCons.addsimg)]),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => All()),
                    );
                  },
                  child: Container(
                    width: 230,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff235aaa),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Post",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
