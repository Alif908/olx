// Photo Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/parts/car_location.dart';

class PhotoPage extends StatefulWidget {
  final Map<String, String> carData;
  final Function(Map<String, dynamic>) onPostCreated;

  PhotoPage({required this.carData, required this.onPostCreated});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  int photoCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Photos'),
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
                  Icon(Icons.photo_library, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text('$photoCount photos selected'),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() => photoCount++);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Photo captured!')),
                      );
                    },
                    icon: Icon(Icons.camera_alt),
                    label: Text('Take Photo'),
                  ),
                  SizedBox(height: 15),
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() => photoCount++);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Photo selected!')),
                      );
                    },
                    icon: Icon(Icons.photo),
                    label: Text('Gallery'),
                  ),
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
                      builder: (context) => LocationPage(
                        carData: widget.carData,
                        onPostCreated: widget.onPostCreated,
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