// Sell Screen - Category Selection
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/parts/car_sell.dart';

class SellScreen extends StatelessWidget {
  final Function(Map<String, dynamic>) onPostCreated;

  SellScreen({required this.onPostCreated});

  final List<Map<String, dynamic>> categories = [
    {'name': 'Cars', 'icon': Icons.directions_car},
    {'name': 'Properties', 'icon': Icons.home},
    {'name': 'Mobiles', 'icon': Icons.phone_android},
    {'name': 'Jobs', 'icon': Icons.work},
    {'name': 'Bikes', 'icon': Icons.two_wheeler},
    {'name': 'Electronics & Appliances', 'icon': Icons.devices},
    {'name': 'Commercial Vehicles', 'icon': Icons.local_shipping},
    {'name': 'Furniture', 'icon': Icons.weekend},
    {'name': 'Fashion', 'icon': Icons.shopping_bag},
    {'name': 'Books & Sports', 'icon': Icons.menu_book},
    {'name': 'Pets', 'icon': Icons.pets},
    {'name': 'Services', 'icon': Icons.room_service},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What are you offering?'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              if (category['name'] == 'Cars') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailsPage(
                      onPostCreated: onPostCreated,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${category['name']} coming soon!')),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category['icon'], size: 50, color: Color(0xFF0056A8)),
                  SizedBox(height: 8),
                  Text(
                    category['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}