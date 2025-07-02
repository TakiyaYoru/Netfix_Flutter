import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NetflixHeader extends StatelessWidget {
  const NetflixHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.mediumPadding,
        vertical: AppSizes.smallPadding, 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 28),
          
          const Text(
            'NETFLIX FLUTTER',
            style: TextStyle(
              color: AppColors.netflixRed,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 3.0, 
              fontFamily: 'Roboto', 
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