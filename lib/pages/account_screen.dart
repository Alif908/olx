import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/parts/olxtopbar.dart';
import 'package:olx/parts/top_bar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topbar(),
          Padding(padding: const EdgeInsets.all(20), child: olxtopbar()),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
