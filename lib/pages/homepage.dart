import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String phone;

  const HomePage({super.key, required this.name, required this.phone});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedscreen = 0;
  List screen = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        onPressed: () {},
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(ImagesCons.sell_logo),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BottomNavigationBar(
        currentIndex: selectedscreen,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          selectedscreen = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_sharp),
            label: "chat",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.aod_sharp), label: "My Ads"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
