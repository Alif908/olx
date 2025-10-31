import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/chatspages/All.dart';
import 'package:olx/chatspages/Buying.dart';
import 'package:olx/chatspages/Selling.dart';
import 'package:olx/parts/top_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedscreens = 0;

  List screens = [All(), Buying(), Selling()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topbar(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Chats",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),

          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(child: _buildTabItem('ALL', 0)),
                Expanded(child: _buildTabItem('BUYING', 1)),
                Expanded(child: _buildTabItem('SELLING', 2)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "QUICK FILTERS",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              children: [
                _buildFilterChip('All'),
                _buildFilterChip('Meeting'),
                _buildFilterChip('Unread'),
                _buildFilterChip('Important'),
                _buildFilterChip('Elite Buyers'),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Expanded(child: screens[selectedscreens]),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    final isSelected = selectedscreens == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedscreens = index;
        });
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.black54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 3,
              color: isSelected ? const Color(0xff235aaa) : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.white,
      side: const BorderSide(color: Colors.grey),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      labelPadding: EdgeInsets.zero,
    );
  }
}
