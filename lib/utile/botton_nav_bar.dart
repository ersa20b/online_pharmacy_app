import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavWidget(
      {Key? key, required this.selectedIndex, required this.onTabChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
        color: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).primaryColor,
        tabActiveBorder: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        gap: 16,
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        tabs: const [
          GButton(
            icon: Icons.home_filled,
            text: 'الرئيسية',
          ),
          GButton(
            icon: Icons.task_outlined,
            text: 'حمل الوصفة',
          ),
          GButton(
            icon: Icons.notifications_none,
            text: 'الاشعارات',
          ),
        ],
      ),
    );
  }
}
