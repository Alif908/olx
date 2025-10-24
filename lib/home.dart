import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';
import 'package:olx/pages/account_screen.dart';
import 'package:olx/pages/chat_screen.dart';
import 'package:olx/pages/homepage.dart';
import 'package:olx/pages/my_ads_screen.dart';
import 'package:olx/sell_screen.dart';

class Home extends StatefulWidget {
  final String name;
  final String phone;
  const Home({super.key, required this.name, required this.phone});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedscreen = 0;
  List screen = [HomePage(), ChatScreen(), MyAdsScreen(), AccountScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 5,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellScreen()),
              );
            },
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(ImagesCons.sell_logo),
              backgroundColor: Colors.white,
            ),
          ),
          Text(
            "sell",
            style: TextStyle(
              color: const Color.fromARGB(255, 94, 93, 93),
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,

      body: screen[selectedscreen],
      bottomNavigationBar: BottomNavigationBar(
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
