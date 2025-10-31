// Notifications Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool recommendations = true;
  bool specialOffers = false;
  bool newMessages = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0056A8),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Recommendations'),
            subtitle: Text('Get personalized recommendations'),
            value: recommendations,
            onChanged: (value) {
              setState(() {
                recommendations = value;
              });
            },
          ),
          Divider(height: 1),
          SwitchListTile(
            title: Text('Special Offers'),
            subtitle: Text('Receive special offers and promotions'),
            value: specialOffers,
            onChanged: (value) {
              setState(() {
                specialOffers = value;
              });
            },
          ),
          Divider(height: 1),
          SwitchListTile(
            title: Text('New Messages'),
            subtitle: Text('Get notified about new messages'),
            value: newMessages,
            onChanged: (value) {
              setState(() {
                newMessages = value;
              });
            },
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}