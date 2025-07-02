// lib/widgets/netflix_header.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NetflixHeader extends StatefulWidget {
  const NetflixHeader({super.key});

  @override
  State<NetflixHeader> createState() => _NetflixHeaderState();
}

class _NetflixHeaderState extends State<NetflixHeader> {
  int _selectedIndex = 0; // Tab được chọn (0: All, 1: TV Shows, 2: Movies, 3: My List)

  final List<String> _tabs = ['All', 'TV Shows', 'Movies', 'My List'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.mediumPadding,
        vertical: AppSizes.smallPadding,
      ),
      child: Column(
        children: [
          // Top row với hamburger menu, logo Netflix và profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Hamburger menu
              const Icon(
                Icons.menu,
                color: AppColors.netflixWhite,
                size: 28,
              ),
              
              // Netflix Logo
              const Text(
                'NETFLIX',
                style: TextStyle(
                  color: AppColors.netflixRed,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              
              // Profile icon
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.netflixRed,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.netflixWhite,
                  size: 20,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppSizes.mediumPadding),
          
          // Navigation tabs (All, TV Shows, Movies, My List)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _tabs.asMap().entries.map((entry) {
              int index = entry.key;
              String tab = entry.value;
              bool isSelected = _selectedIndex == index;
              
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      tab,
                      style: TextStyle(
                        color: isSelected 
                          ? AppColors.netflixWhite 
                          : AppColors.netflixLightGrey,
                        fontSize: 16,
                        fontWeight: isSelected 
                          ? FontWeight.w600 
                          : FontWeight.normal,
                      ),
                    ),
                    
                    // Indicator cho tab được chọn
                    if (isSelected) ...[
                      const SizedBox(height: 4),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: AppColors.netflixWhite,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}