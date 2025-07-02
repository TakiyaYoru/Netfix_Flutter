// lib/widgets/movie_card_with_badge.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';

enum BadgeType {
  muaMoi, // Mùa mới
  tapMoi, // Tập mới
  top10,  // TOP 10
  none,   // Không có badge
}

class MovieCardWithBadge extends StatelessWidget {
  final Movie movie;
  final BadgeType badgeType;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const MovieCardWithBadge({
    super.key,
    required this.movie,
    this.badgeType = BadgeType.none,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = width ?? AppSizes.movieCardWidth;
    final cardHeight = height ?? AppSizes.movieCardHeight;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.only(right: AppSizes.smallPadding),
        child: Stack(
          children: [
            // Movie poster
            Container(
              height: cardHeight,
              width: cardWidth,
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
                          'Lỗi tải\nhình ảnh',
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

            // Badge overlay
            if (badgeType != BadgeType.none)
              Positioned(
                top: 8,
                left: 8,
                child: _buildBadge(),
              ),

            // Netflix N logo (top right)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.netflixRed,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'N',
                    style: TextStyle(
                      color: AppColors.netflixWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge() {
    String text;
    Color backgroundColor;

    switch (badgeType) {
      case BadgeType.muaMoi:
        text = 'Mùa mới';
        backgroundColor = AppColors.netflixRed;
        break;
      case BadgeType.tapMoi:
        text = 'Tập mới';
        backgroundColor = AppColors.netflixRed;
        break;
      case BadgeType.top10:
        text = 'TOP\n10';
        backgroundColor = AppColors.netflixRed;
        break;
      case BadgeType.none:
        return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.netflixWhite,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}