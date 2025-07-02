import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const NetflixCloneApp());
}

class NetflixCloneApp extends StatelessWidget {
  const NetflixCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: AppColors.netflixRed,
        scaffoldBackgroundColor: AppColors.netflixBlack,
        fontFamily: 'Roboto', 
        
        // Thiết lập màu text mặc định
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.netflixWhite),
          bodyMedium: TextStyle(color: AppColors.netflixWhite),
          bodySmall: TextStyle(color: AppColors.netflixLightGrey),
          headlineLarge: TextStyle(color: AppColors.netflixWhite),
          headlineMedium: TextStyle(color: AppColors.netflixWhite),
          headlineSmall: TextStyle(color: AppColors.netflixWhite),
        ),
        
        // Thiết lập AppBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.netflixBlack,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.netflixWhite),
          titleTextStyle: TextStyle(
            color: AppColors.netflixWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}