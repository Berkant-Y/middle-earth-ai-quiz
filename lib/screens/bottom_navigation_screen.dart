/*
 * BOTTOM NAVIGATION SCREEN - Alt Navigasyon Ekranı
 * 
 * Ana menü, harita ve profil sayfaları arasında geçiş sağlar.
 */

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'main_menu_screen.dart';
import 'map_screen.dart';
import 'profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MainMenuScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[700],
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppConstants.strings.mainMenu,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: AppConstants.strings.map,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppConstants.strings.profile,
          ),
        ],
      ),
    );
  }
}