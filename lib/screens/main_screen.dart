import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'home_screen.dart';
import 'card_design_practice_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Chỉ số của tab hiện tại
  int _currentIndex = 0;
  
  // Danh sách các screen - thêm Card Design Practice
  final List<Widget> _screens = [
    const HomeScreen(),
    const PlaceholderScreen(title: 'Mới & Hot'),
    const PlaceholderScreen(title: 'Netflix của tôi'),
    const CardDesignPracticeScreen(),
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
        backgroundColor: AppColors.netflixBlack,
        selectedItemColor: AppColors.netflixWhite,
        unselectedItemColor: AppColors.netflixLightGrey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        
        // Danh sách các tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Mới & Hot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Netflix của tôi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services),
            label: 'Pr: Card design',
          ),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  
  const PlaceholderScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.netflixBlack,
      body: Center(
        child: Text(
          '$title Screen',
          style: const TextStyle(
            color: AppColors.netflixWhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}