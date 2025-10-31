// Packages Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PackagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF002F34),
        title: Text('Packages & Orders', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // Package 1
          Card(
            child: ListTile(
              title: Text('Premium Package', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Boost your ads'),
              trailing: Text('₹199', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          // Package 2
          Card(
            child: ListTile(
              title: Text('Featured Package', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Get featured listing'),
              trailing: Text('₹99', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          // Package 3
          Card(
            child: ListTile(
              title: Text('Urgent Package', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Mark as urgent'),
              trailing: Text('₹49', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}