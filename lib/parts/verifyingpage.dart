// Verify Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  final Map<String, String> carData;
  final Function(Map<String, dynamic>) onPostCreated;

  VerifyPage({required this.carData, required this.onPostCreated});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool isVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
        backgroundColor: Color(0xFF0056A8),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 50),
                  ),
                  SizedBox(height: 15),
                  Text('John Doe', style: TextStyle(fontSize: 20)),
                  Text('+91 9876543210'),
                  SizedBox(height: 20),
                  if (!isVerified)
                    ElevatedButton(
                      onPressed: () {
                        setState(() => isVerified = true);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Verified!')),
                        );
                      },
                      child: Text('Verify Phone'),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        Text(' Verified'),
                      ],
                    ),
                  SizedBox(height: 30),
                  Text('Review Details:', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  ...widget.carData.entries.map((e) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Text('${e.key}: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(e.value),
                          ],
                        ),
                      )),
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
                onPressed: isVerified
                    ? () {
                        // Create post
                        Map<String, dynamic> newPost = {
                          'id': DateTime.now().millisecondsSinceEpoch,
                          'image': null,
                          'price': widget.carData['price'],
                          'title': widget.carData['title'],
                          'subtitle': '${widget.carData['year']} - ${widget.carData['km']} km',
                          'location': 'Perumpāvūr, Kerala',
                          'featured': false,
                        };

                        widget.onPostCreated(newPost);
                        
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ad posted successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isVerified ? Colors.green : Colors.grey,
                ),
                child: Text('Post Ad', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}