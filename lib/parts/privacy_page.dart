
// Privacy Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool passwordEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0056A8),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Privacy', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Password'),
            subtitle: Text('Protect your account with password'),
            value: passwordEnabled,
            onChanged: (value) {
              setState(() {
                passwordEnabled = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(value ? 'Password enabled' : 'Password disabled'),
                ),
              );
            },
          ),
          Divider(height: 1),
          ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              // Show change password dialog
              TextEditingController passController = TextEditingController();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Change Password'),
                  content: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Password changed!')),
                        );
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(height: 1),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Privacy Policy'),
                  content: Text('Your privacy is important to us. We protect your data and never share it with third parties.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}