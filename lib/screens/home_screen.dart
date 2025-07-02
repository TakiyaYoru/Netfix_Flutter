// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';
import '../widgets/netflix_header.dart';
import '../widgets/hero_banner.dart';
import '../widgets/movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy movie đầu tiên làm hero banner
    final heroMovie = SampleData.trendingMovies.first;

    return Scaffold(
      backgroundColor: AppColors.netflixBlack,
      body: CustomScrollView(
        slivers: [
          // Sticky header
          SliverAppBar(
            backgroundColor: AppColors.netflixBlack,
            elevation: 0,
            pinned: true,
            floating: true,
            expandedHeight: 0,
            flexibleSpace: const SafeArea(
              child: NetflixHeader(),
            ),
          ),

          // Content
          SliverList(
            delegate: SliverChildListDelegate([
              // Hero Banner
              HeroBanner(movie: heroMovie),

              const SizedBox(height: AppSizes.largePadding),

              // Continue Watching
              ContinueWatchingList(
                movies: SampleData.trendingMovies.take(4).toList(),
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Popular on Netflix (với card lớn)
              PopularMovieList(
                title: 'Popular on Netflix',
                movies: SampleData.popularMovies,
                onSeeAllPressed: () {
                  print('See all Popular movies');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Trending Now
              MovieList(
                title: 'Trending Now',
                movies: SampleData.trendingMovies,
                onSeeAllPressed: () {
                  print('See all Trending movies');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Action Movies
              MovieList(
                title: 'Action',
                movies: SampleData.actionMovies,
                onSeeAllPressed: () {
                  print('See all Action movies');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Netflix Originals
              MovieList(
                title: 'Netflix Originals',
                movies: SampleData.trendingMovies
                    .where((movie) => movie.isNetflixOriginal)
                    .toList(),
                onSeeAllPressed: () {
                  print('See all Netflix Originals');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // My List (có thể empty state)
              MovieList(
                title: 'My List',
                movies: SampleData.popularMovies.take(3).toList(),
                onSeeAllPressed: () {
                  print('See all My List');
                },
                showSeeAll: false, // Không hiển thị "See all" cho My List
              ),

              // Bottom spacing để tránh bị che bởi bottom navigation
              const SizedBox(height: 100),
            ]),
          ),
        ],
      ),
    );
  }
}