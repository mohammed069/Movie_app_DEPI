import 'package:depi_film_app/helpers/themes/app_colors.dart';
import 'package:depi_film_app/view/screens/home_screen.dart';
import 'package:depi_film_app/view/screens/watch_list_screen.dart';
import 'package:flutter/material.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  int _currentIndex = 0;
  List<Widget> _screens = [HomeScreen(), WatchListScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.primaryTextColor,
        unselectedItemColor: AppColors.secondaryTextColor,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            activeIcon: Icon(Icons.bookmark),
            label: 'Watch List',
          ),
        ],
      ),
    );
  }
}
