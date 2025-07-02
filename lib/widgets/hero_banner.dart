import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';

class HeroBanner extends StatelessWidget {
  final Movie movie;

  const HeroBanner({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.heroBannerHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // Background image
          CachedNetworkImage(
            imageUrl: movie.imageUrl,
            height: AppSizes.heroBannerHeight,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: AppColors.netflixGrey,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.netflixRed,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: AppColors.netflixGrey,
              child: const Icon(
                Icons.error,
                color: AppColors.netflixWhite,
                size: 50,
              ),
            ),
          ),

          // Gradient overlay (từ trong suốt đến đen)
          Container(
            height: AppSizes.heroBannerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.7, 1.0],
                colors: [
                  Colors.transparent,
                  AppColors.netflixBlack.withOpacity(0.5),
                  AppColors.netflixBlack,
                ],
              ),
            ),
          ),

          // Content overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.mediumPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Netflix Original badge (nếu có)
                  if (movie.isNetflixOriginal) ...[
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/netflix_logo_small.png',
                          height: 20,
                          width: 20,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: AppColors.netflixRed,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  'N',
                                  style: TextStyle(
                                    color: AppColors.netflixWhite,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'SERIES',
                          style: TextStyle(
                            color: AppColors.netflixWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],

                  // Movie title
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: AppColors.netflixWhite,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Movie info (year, rating, genre)
                  Row(
                    children: [
                      Text(
                        '${movie.year}',
                        style: const TextStyle(
                          color: AppColors.netflixLightGrey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      // Rating
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating.toString(),
                            style: const TextStyle(
                              color: AppColors.netflixLightGrey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(width: 16),
                      
                      Text(
                        movie.genre,
                        style: const TextStyle(
                          color: AppColors.netflixLightGrey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Action buttons
                  Row(
                    children: [
                      // Play button
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Implement play functionality
                            print('Play ${movie.title}');
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: AppColors.netflixBlack,
                          ),
                          label: const Text(
                            'Play',
                            style: TextStyle(
                              color: AppColors.netflixBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.netflixWhite,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // My List button
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Implement add to list functionality
                            print('Add ${movie.title} to My List');
                          },
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.netflixWhite,
                          ),
                          label: const Text(
                            'My List',
                            style: TextStyle(
                              color: AppColors.netflixWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.netflixGrey,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Info button
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.netflixGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            // TODO: Implement info functionality
                            print('Show info for ${movie.title}');
                          },
                          icon: const Icon(
                            Icons.info_outline,
                            color: AppColors.netflixWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}