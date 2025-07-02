// lib/widgets/movie_list.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';
import 'movie_card.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onSeeAllPressed;
  final bool showSeeAll;

  const MovieList({
    super.key,
    required this.title,
    required this.movies,
    this.onSeeAllPressed,
    this.showSeeAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header với title và "See All"
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.mediumPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Section title
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.netflixWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // "See All" button
              if (showSeeAll)
                GestureDetector(
                  onTap: onSeeAllPressed,
                  child: const Text(
                    'See all',
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

        // Horizontal scrolling movie list
        SizedBox(
          height: AppSizes.movieCardHeight + 20, // Card height + thêm một chút space
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.mediumPadding,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: movies[index],
                onTap: () {
                  // Navigate to movie detail
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(movie: movies[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Widget đặc biệt cho Top 10 với ranking numbers
class Top10MovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onSeeAllPressed;

  const Top10MovieList({
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
            ],
          ),
        ),

        const SizedBox(height: AppSizes.smallPadding),

        // Horizontal scrolling với ranking numbers
        SizedBox(
          height: AppSizes.movieCardHeight + 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.mediumPadding,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: movies[index],
                showRanking: true, // Hiển thị số thứ tự lớn
                onTap: () {
                  // Navigate to movie detail
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(movie: movies[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}