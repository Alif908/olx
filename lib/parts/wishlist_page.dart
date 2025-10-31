// Wishlist Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF002F34),
        title: Text('Wishlist', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          // Item 1
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
                child: Icon(Icons.image),
              ),
              title: Text('iPhone 13'),
              subtitle: Text('₹45,000'),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
          // Item 2
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
                child: Icon(Icons.image),
              ),
              title: Text('Samsung TV 55"'),
              subtitle: Text('₹35,000'),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}