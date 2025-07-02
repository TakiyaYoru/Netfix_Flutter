// lib/widgets/top10_card.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';

class Top10Card extends StatelessWidget {
  final Movie movie;
  final int ranking; // Thứ hạng (1, 2, 3...)
  final VoidCallback? onTap;

  const Top10Card({
    super.key,
    required this.movie,
    required this.ranking,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200, // Rộng hơn card thường
        margin: const EdgeInsets.only(right: AppSizes.smallPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Số thứ hạng lớn
            Container(
              width: 60,
              alignment: Alignment.bottomCenter,
              child: Text(
                '$ranking',
                style: TextStyle(
                  fontSize: 120, // Số rất lớn
                  fontWeight: FontWeight.w900,
                  color: AppColors.netflixWhite,
                  height: 0.8, // Giảm line height
                  shadows: [
                    Shadow(
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      color: AppColors.netflixBlack.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),

            // Movie poster
            Expanded(
              child: Container(
                height: 160,
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
            ),
          ],
        ),
      ),
    );
  }
}

// Widget cho danh sách TOP 10
class Top10List extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onSeeAllPressed;

  const Top10List({
    super.key,
    required this.title,
    required this.movies,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.mediumPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.netflixWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (onSeeAllPressed != null)
                GestureDetector(
                  onTap: onSeeAllPressed,
                  child: const Text(
                    'Xem tất cả',
                    style: TextStyle(
                      color: AppColors.netflixLightGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: AppSizes.smallPadding),

        // Horizontal scrolling TOP 10 list
        SizedBox(
          height: 180, // Cao hơn card thường để chứa số lớn
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.mediumPadding,
            ),
            itemCount: movies.length > 10 ? 10 : movies.length, // Tối đa 10 items
            itemBuilder: (context, index) {
              return Top10Card(
                movie: movies[index],
                ranking: index + 1, // Thứ hạng từ 1
                onTap: () {
                  print('Tapped on #${index + 1} ${movies[index].title}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}