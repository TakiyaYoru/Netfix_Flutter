// lib/widgets/movie_card.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  final bool showRanking; // Hiển thị số thứ tự lớn cho Top 10

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
    this.showRanking = false, // Mặc định là false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        // Default navigation to movie detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      child: Container(
        width: AppSizes.movieCardWidth,
        margin: const EdgeInsets.only(right: AppSizes.smallPadding),
        child: Stack(
          children: [
            // Movie poster
            Container(
              height: AppSizes.movieCardHeight,
              width: AppSizes.movieCardWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.netflixBlack.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: movie.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.netflixGrey,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.netflixRed,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.netflixGrey,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: AppColors.netflixWhite,
                          size: 32,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lỗi\nHình ảnh',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.netflixWhite,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Netflix logo (top left)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: const Text(
                  'N',
                  style: TextStyle(
                    color: AppColors.netflixRed,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Badge (top right)
            if (movie.badge != null)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: movie.badge == 'TOP 10' 
                        ? AppColors.netflixRed 
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    movie.badge!,
                    style: const TextStyle(
                      color: AppColors.netflixWhite,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // Large ranking number (for Top 10)
            if (showRanking && movie.ranking != null)
              Positioned(
                bottom: -10,
                left: -10,
                child: Text(
                  '${movie.ranking}',
                  style: TextStyle(
                    color: AppColors.netflixWhite,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: AppColors.netflixBlack.withOpacity(0.8),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}