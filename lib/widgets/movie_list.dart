// lib/widgets/movie_list.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';
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
                  // TODO: Navigate to movie detail screen
                  print('Tapped on ${movies[index].title}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Variant cho "Popular on Netflix" với card lớn hơn
class PopularMovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onSeeAllPressed;

  const PopularMovieList({
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
              // "See All" button
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

        // Horizontal scrolling với card lớn hơn
        SizedBox(
          height: 230, // Cao hơn cho large cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.mediumPadding,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCardLarge(
                movie: movies[index],
                onTap: () {
                  print('Tapped on ${movies[index].title}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Widget cho "Continue Watching" (có progress bar)
class ContinueWatchingList extends StatelessWidget {
  final List<Movie> movies;

  const ContinueWatchingList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.mediumPadding,
          ),
          child: Text(
            'Continue Watching',
            style: TextStyle(
              color: AppColors.netflixWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: AppSizes.smallPadding),

        SizedBox(
          height: AppSizes.movieCardHeight + 40, // Thêm space cho progress bar
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.mediumPadding,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Container(
                width: AppSizes.movieCardWidth,
                margin: const EdgeInsets.only(right: AppSizes.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie card
                    MovieCard(
                      movie: movies[index],
                      onTap: () {
                        print('Continue watching ${movies[index].title}');
                      },
                    ),

                    const SizedBox(height: 4),

                    // Progress bar
                    Container(
                      height: 3,
                      width: AppSizes.movieCardWidth,
                      decoration: BoxDecoration(
                        color: AppColors.netflixGrey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.3 + (index * 0.2), // Fake progress
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.netflixRed,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}