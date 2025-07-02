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
    // Lấy các movies cho hero banner carousel
    final heroMovies = [
      ...SampleData.trending.take(3), // 3 phim từ Trending
      ...SampleData.newOnNetflix.take(2), // 2 phim từ Mới trên Netflix
    ];

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
              // Thêm khoảng cách giữa header và hero banner
              const SizedBox(height: AppSizes.smallPadding),
              
              // Hero Banner Carousel
              HeroBanner(movies: heroMovies),

              const SizedBox(height: AppSizes.largePadding),

              // Trending - Phim đang thịnh hành
              MovieList(
                title: 'Trending',
                movies: SampleData.trending,
                onSeeAllPressed: () {
                  print('See all Trending movies');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Top 10 series tại Việt Nam hôm nay (với ranking numbers)
              Top10MovieList(
                title: 'Top 10 series tại Việt Nam hôm nay',
                movies: SampleData.top10Vietnam,
                onSeeAllPressed: () {
                  print('See all Top 10 Vietnam');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Mới trên Netflix
              MovieList(
                title: 'Mới trên Netflix',
                movies: SampleData.newOnNetflix,
                onSeeAllPressed: () {
                  print('See all New on Netflix');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Anime
              MovieList(
                title: 'Anime',
                movies: SampleData.anime,
                onSeeAllPressed: () {
                  print('See all Anime');
                },
              ),

              const SizedBox(height: AppSizes.largePadding),

              // Phim Mỹ lồng tiếng Việt
              MovieList(
                title: 'Phim Mỹ lồng tiếng Việt',
                movies: SampleData.americanMoviesVietnameseDub,
                onSeeAllPressed: () {
                  print('See all American Movies Vietnamese Dub');
                },
                showSeeAll: true,
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