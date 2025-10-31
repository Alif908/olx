import 'package:flutter/material.dart';
import 'package:olx/parts/olxtopbar.dart';
import 'package:olx/parts/top_bar.dart';
import 'package:olx/parts/wishlist_page.dart';
import 'package:olx/parts/help_screen.dart';
import 'package:olx/pages/package_page.dart';
import 'package:olx/parts/settings.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String phone;

  const ProfilePage({
    super.key,
    required this.userName,
    required this.phone,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String userName;
  late String phone;
  int stepsLeft = 4;

  @override
  void initState() {
    super.initState();
    userName = widget.userName;
    phone = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topbar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.all(20), child: olxtopbar()),
              ],
            ),
            const SizedBox(height: 50),

            // Profile Info
            Row(
              children: [
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.yellow,
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF23A5AD),
                    child: Icon(Icons.person, size: 40, color: Colors.yellow),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _editProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff235aaa),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'View and Edit Profile',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Steps Left
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$stepsLeft steps left',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: (5 - stepsLeft) / 5,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.yellow),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We are built on trust. Help one another to get to know each other better.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Divider(),

            // Menu Options
            _menuOption(
              icon: Icons.shopping_bag,
              title: 'Buy Packages & My Orders',
              subtitle: 'Packages, orders, billing and invoices',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PackagesPage()),
              ),
            ),
            _menuOption(
              icon: Icons.favorite_border,
              title: 'Wishlist',
              subtitle: 'View your liked items here',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistPage()),
              ),
            ),
            Container(
              color: const Color(0xFFE8F4F8),
              child: _menuOption(
                icon: Icons.star_border,
                title: 'Become an Elite Buyer',
                subtitle: 'Call owners directly',
                onTap: _showEliteBuyerDialog,
              ),
            ),
            _menuOption(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Privacy and logout',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              ),
            ),
            _menuOption(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Help center and legal terms',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Menu Option Widget
  Widget _menuOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 28),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }

  // Edit Profile Dialog
  void _editProfile() {
    TextEditingController nameController = TextEditingController(text: userName);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Enter your name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  if (stepsLeft > 0) stepsLeft--;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile updated!')),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Elite Buyer Dialog
  void _showEliteBuyerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Become Elite Buyer'),
          content: const Text(
            'Get premium benefits:\n\n• Call owners directly\n• Priority support\n• Exclusive deals\n\nPrice: ₹499/month',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Welcome to Elite Buyer!')),
                );
              },
              child: const Text('Subscribe'),
            ),
          ],
        );
      },
    );
  }
}
