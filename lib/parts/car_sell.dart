// Car Details Form
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/parts/photo_page.dart';

class CarDetailsPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onPostCreated;

  CarDetailsPage({required this.onPostCreated});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  TextEditingController brandController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String transmission = 'Automatic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Include some details'),
        backgroundColor: Color(0xFF0056A8),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: brandController,
              decoration: InputDecoration(
                labelText: 'Brand *',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Year *',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: fuelController,
              decoration: InputDecoration(
                labelText: 'Fuel *',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Text('Transmission', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => setState(() => transmission = 'Automatic'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: transmission == 'Automatic'
                            ? Color(0xFF0056A8)
                            : Colors.grey,
                        width: transmission == 'Automatic' ? 2 : 1,
                      ),
                    ),
                    child: Text('Automatic'),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => setState(() => transmission = 'Manual'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: transmission == 'Manual'
                            ? Color(0xFF0056A8)
                            : Colors.grey,
                        width: transmission == 'Manual' ? 2 : 1,
                      ),
                    ),
                    child: Text('Manual'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextField(
              controller: kmController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'KM driven *',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price *',
                border: UnderlineInputBorder(),
                prefixText: '₹ ',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: titleController,
              maxLength: 70,
              decoration: InputDecoration(
                labelText: 'Ad title*',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description *',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (brandController.text.isEmpty ||
                      yearController.text.isEmpty ||
                      priceController.text.isEmpty ||
                      titleController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Fill required fields!')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoPage(
                        carData: {
                          'brand': brandController.text,
                          'year': yearController.text,
                          'fuel': fuelController.text,
                          'transmission': transmission,
                          'km': kmController.text,
                          'price': '₹ ${priceController.text}',
                          'title': titleController.text,
                          'description': descriptionController.text,
                        },
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
          ],
        ),
      ),
    );
  }
}