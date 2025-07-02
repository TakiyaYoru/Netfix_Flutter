import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class HeroBanner extends StatelessWidget {
  final List<Movie> movies; 

  const HeroBanner({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.heroBannerHeight,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        autoplay: true,
        autoplayDelay: 5000,
        duration: 800, 
        pagination: null,
        control: null, 
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _buildHeroBannerItem(movie, context);
        },
      ),
    );
  }

  Widget _buildHeroBannerItem(Movie movie, BuildContext context) {
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

          Container(
            height: AppSizes.heroBannerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.5, 0.8, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  AppColors.netflixBlack.withOpacity(0.6),
                  AppColors.netflixBlack.withOpacity(0.9),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.mediumPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movie.isNetflixOriginal) ...[
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
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


                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      movie.title,
                      style: TextStyle(
                        color: AppColors.netflixWhite,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            color: AppColors.netflixBlack.withOpacity(0.8),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Movie info
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.netflixBlack.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Năm
                        Text(
                          '${movie.year}',
                          style: const TextStyle(
                            color: AppColors.netflixWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        
                        const SizedBox(width: 12),
                        
                        // Rating 
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.rating.toString(),
                              style: const TextStyle(
                                color: AppColors.netflixWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(width: 12),
                        
                        // Thể loại
                        Text(
                          movie.genre,
                          style: const TextStyle(
                            color: AppColors.netflixWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Play button 
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to movie detail
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(movie: movie),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        color: AppColors.netflixBlack,
                        size: 32,
                      ),
                      label: const Text(
                        'Phát',
                        style: TextStyle(
                          color: AppColors.netflixBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.netflixWhite,
                        elevation: 8, 
                        shadowColor: AppColors.netflixBlack.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
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