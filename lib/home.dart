import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/images/images_cons.dart';
import 'package:olx/pages/account_screen.dart';
import 'package:olx/pages/chat_screen.dart';
import 'package:olx/pages/homepage.dart';
import 'package:olx/pages/my_ads_screen.dart';
import 'package:olx/pages/profile.dart';
import 'package:olx/pages/sell_screen.dart';

class Home extends StatefulWidget {
  final String name;
  final String phone;
  const Home({super.key, required this.name, required this.phone});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedscreen = 0;

  @override
  Widget build(BuildContext context) {
    // ✅ Pass login data to ProfilePage here
    final List<Widget> screens = [
      const HomePage(),
      const ChatScreen(),
      const MyAdsScreen(),
      ProfilePage(userName: widget.name, phone: widget.phone),
    ];

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 5,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SellScreen(
                    onPostCreated: (Map<String, dynamic> postData) {
                      // ✅ You can handle what happens after posting
                      print("New post created: $postData");

                      // Example: show confirmation or refresh homepage
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Post created successfully!"),
                        ),
                      );

                      // Optionally, return to Home after post
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: 28,
              backgroundImage: const AssetImage(ImagesCons.sell_logo),
              backgroundColor: Colors.white,
            ),
          ),
          const Text(
            "Sell",
            style: TextStyle(
              color: Color.fromARGB(255, 94, 93, 93),
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,

      body: screens[selectedscreen],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedscreen,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedscreen = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_sharp),
            label: "Chat",
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
