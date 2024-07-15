import 'package:flutter/material.dart';
import 'package:servease/views/home/get_lat_long.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  void _onTap(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GetLatLongScreen()),
      );
    }
    onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _onTap(context, index),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(top: 2),
            child: Image.asset('assets/images/Scroll.png', height: 35),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(top: 2),
            child: Image.asset('assets/images/Home.png', height: 35),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(top: 2),
            child: Image.asset('assets/images/User.png', height: 35),
          ),
          label: '',
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(0.6),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
    );
  }
}
