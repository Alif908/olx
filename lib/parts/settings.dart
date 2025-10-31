import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/login%20page/login.dart';
import 'package:olx/parts/notification_page.dart';
import 'package:olx/parts/privacy_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top Bar
      appBar: AppBar(
        backgroundColor: Color(0xFF0056A8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Go back
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),

      // Main Content
      body: ListView(
        children: [
          // Privacy Option
          ListTile(
            title: Text(
              'Privacy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Create password',
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
            onTap: () {
              // Go to Privacy page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPage()),
              );
            },
          ),
          Divider(height: 1),

          // Notifications Option
          ListTile(
            title: Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Recommendations & Special communications',
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              // Go to Notifications page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
          Divider(height: 1),

          // Logout Option
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Show logout dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Logout'),
                  content: Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Close dialog
                        Navigator.pop(context);
                        // Go back to home and remove all previous pages
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false,
                        );
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(height: 1),

          // Logout from all devices Option
          ListTile(
            title: Text(
              'Logout from all devices',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Show logout all dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Logout from All Devices'),
                  content: Text(
                    'This will logout from all devices. Are you sure?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Close dialog
                        Navigator.pop(context);
                        // Go to login page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Logout All'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(height: 1),

          // Delete account Option
          ListTile(
            title: Text(
              'Delete account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
            onTap: () {
              // Show delete account dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  ),
                  content: Text(
                    'This action cannot be undone. All your data will be permanently deleted. Are you sure?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Close dialog
                        Navigator.pop(context);
                        // Go to login page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}
