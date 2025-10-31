// Location Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/parts/verifyingpage.dart';

class LocationPage extends StatelessWidget {
  final Map<String, String> carData;
  final Function(Map<String, dynamic>) onPostCreated;

  LocationPage({required this.carData, required this.onPostCreated});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor: Color(0xFF0056A8),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 80, color: Color(0xFF0056A8)),
                  SizedBox(height: 20),
                  Text('Current Location', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Perumpāvūr, Kerala', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyPage(
                        carData: carData,
                        onPostCreated: onPostCreated,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0056A8),
                ),
                child: Text('Next', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}