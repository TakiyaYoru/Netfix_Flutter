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
                onTap: () {
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