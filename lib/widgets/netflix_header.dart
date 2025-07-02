// lib/widgets/netflix_header.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NetflixHeader extends StatelessWidget {
  const NetflixHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.mediumPadding,
        vertical: AppSizes.smallPadding, // Giảm padding vertical
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Placeholder invisible để cân bằng
          const SizedBox(width: 28),
          
          // Netflix Flutter Logo ở giữa
          const Text(
            'NETFLIX FLUTTER',
            style: TextStyle(
              color: AppColors.netflixRed,
              fontSize: 24,
              fontWeight: FontWeight.w900, // Extra bold như Netflix
              letterSpacing: 3.0, // Letter spacing rộng hơn
              fontFamily: 'Roboto', // Font giống Netflix
            ),
          ),
          
          // Search icon
          const Icon(
            Icons.search,
            color: AppColors.netflixWhite,
            size: 28,
          ),
        ],
      ),
    );
  }
}