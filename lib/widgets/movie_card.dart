import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSizes.movieCardWidth,
        margin: const EdgeInsets.only(right: AppSizes.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Image\nError',
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

            const SizedBox(height: 8),

            // Movie title (optional, có thể ẩn để giống Netflix)
            // Uncomment nếu muốn hiển thị title dưới poster
            /*
            Text(
              movie.title,
              style: const TextStyle(
                color: AppColors.netflixWhite,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            */
          ],
        ),
      ),
    );
  }
}

// Variant của MovieCard cho các kích thước khác nhau
class MovieCardLarge extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const MovieCardLarge({
    super.key,
    required this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140, // Lớn hơn card thường
        margin: const EdgeInsets.only(right: AppSizes.smallPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: movie.imageUrl,
            height: 210, // Cao hơn card thường
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 210,
              color: AppColors.netflixGrey,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.netflixRed,
                  strokeWidth: 2,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 210,
              color: AppColors.netflixGrey,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: AppColors.netflixWhite,
                    size: 40,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Image Error',
                    style: TextStyle(
                      color: AppColors.netflixWhite,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}