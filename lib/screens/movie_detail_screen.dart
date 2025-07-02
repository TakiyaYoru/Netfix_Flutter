// lib/screens/movie_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isInMyList = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.netflixBlack,
      body: CustomScrollView(
        slivers: [
          // Hero Video/Image Section
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: AppColors.netflixBlack,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.netflixBlack.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.netflixWhite,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.netflixBlack.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.volume_off,
                    color: AppColors.netflixWhite,
                  ),
                  onPressed: () {
                    // Toggle sound
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image/video
                  CachedNetworkImage(
                    imageUrl: widget.movie.imageUrl,
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

                  // Gradient overlay
                  Container(
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

                  // Netflix logo và series type
                  if (widget.movie.isNetflixOriginal)
                    Positioned(
                      top: 100,
                      left: 16,
                      child: Row(
                        children: [
                          Container(
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
                          const SizedBox(width: 8),
                          const Text(
                            'LOẠT PHIM',
                            style: TextStyle(
                              color: AppColors.netflixWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.netflixBlack,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie title
                    Text(
                      widget.movie.title,
                      style: const TextStyle(
                        color: AppColors.netflixWhite,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Movie info
                    Row(
                      children: [
                        Text(
                          '${widget.movie.year}',
                          style: const TextStyle(
                            color: AppColors.netflixLightGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.netflixLightGrey,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'T18',
                            style: TextStyle(
                              color: AppColors.netflixLightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '3 mùa',
                          style: const TextStyle(
                            color: AppColors.netflixLightGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.netflixLightGrey,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'HD',
                            style: TextStyle(
                              color: AppColors.netflixLightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Preview text
                    const Text(
                      'Xem ngay mùa cuối',
                      style: TextStyle(
                        color: AppColors.netflixWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Action buttons
                    Row(
                      children: [
                        // Continue watching button
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print('Continue watching ${widget.movie.title}');
                              },
                              icon: const Icon(
                                Icons.play_arrow,
                                color: AppColors.netflixBlack,
                                size: 28,
                              ),
                              label: const Text(
                                'Tiếp tục xem',
                                style: TextStyle(
                                  color: AppColors.netflixBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.netflixWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Download button
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print('Download ${widget.movie.title}');
                              },
                              icon: const Icon(
                                Icons.download,
                                color: AppColors.netflixWhite,
                                size: 20,
                              ),
                              label: const Text(
                                'Tải xuống M2:T1',
                                style: TextStyle(
                                  color: AppColors.netflixWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.netflixGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Episode info với progress bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.netflixGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'M2:T1 ',
                                style: TextStyle(
                                  color: AppColors.netflixWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Bánh mì và vé số',
                                style: TextStyle(
                                  color: AppColors.netflixWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'còn 59p',
                                style: TextStyle(
                                  color: AppColors.netflixLightGrey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Progress bar
                          Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.netflixGrey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.3, // 30% progress
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.netflixRed,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Episode description
                          Text(
                            'Muốn trả thù, Gi Hun quay đầu tại sân bay. Sau đó, tại nơi ẩn náu của mình, anh rào riết tìm kiếm người chiều mộ bí ẩn thoạt ẩn thoạt hiện đang tìm kiếm người chơi mới.',
                            style: const TextStyle(
                              color: AppColors.netflixLightGrey,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Action icons row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          icon: _isInMyList ? Icons.check : Icons.add,
                          label: 'Danh sách\ncủa tôi',
                          onTap: () {
                            setState(() {
                              _isInMyList = !_isInMyList;
                            });
                          },
                        ),
                        _buildActionButton(
                          icon: Icons.thumb_up_outlined,
                          label: 'Xếp hạng',
                          onTap: () {
                            print('Rate movie');
                          },
                        ),
                        _buildActionButton(
                          icon: Icons.share,
                          label: 'Chia sẻ',
                          onTap: () {
                            print('Share movie');
                          },
                        ),
                        _buildActionButton(
                          icon: Icons.download,
                          label: 'Tải xuống\nMùa 2',
                          onTap: () {
                            print('Download season 2');
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Tab bar
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.netflixGrey.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: false,
                        labelColor: AppColors.netflixWhite,
                        unselectedLabelColor: AppColors.netflixLightGrey,
                        indicatorColor: AppColors.netflixRed,
                        indicatorWeight: 3,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        tabs: const [
                          Tab(text: 'Các tập'),
                          Tab(text: 'Bộ sưu tập'),
                          Tab(text: 'Tương tự'),
                          Tab(text: 'Trailer'),
                        ],
                      ),
                    ),

                    // Tab content
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildEpisodesTab(),
                          _buildCollectionsTab(),
                          _buildSimilarContentTab(),
                          _buildTrailersTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: AppColors.netflixWhite,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.netflixWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodesTab() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          // Season selector
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.netflixGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Mùa 2',
                    style: TextStyle(
                      color: AppColors.netflixWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.netflixWhite,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Episodes list
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildEpisodeItem(index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodeItem(int episodeNumber) {
    final List<String> episodeTitles = [
      'Bánh mì và vé số',
      'Bữa tiệc Halloween',
      '001',
    ];

    final List<String> durations = ['1g 5p', '51p', '1g 2p'];

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Episode thumbnail
          Container(
            width: 120,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.netflixGrey,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: widget.movie.imageUrl,
                    width: 120,
                    height: 68,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.netflixGrey,
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.netflixGrey,
                    ),
                  ),
                ),
                const Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    color: AppColors.netflixWhite,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Episode info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$episodeNumber. ${episodeTitles[episodeNumber - 1]}',
                        style: const TextStyle(
                          color: AppColors.netflixWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.download,
                      color: AppColors.netflixWhite,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  durations[episodeNumber - 1],
                  style: const TextStyle(
                    color: AppColors.netflixLightGrey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Muốn trả thù, Gi Hun quay đầu tại sân bay. Sau đó, tại nơi ẩn náu của mình, anh rào riết tìm kiếm người chiều mộ bí ẩn thoạt ẩn thoạt hiện đang tìm kiếm người chơi mới.',
                  style: TextStyle(
                    color: AppColors.netflixLightGrey,
                    fontSize: 14,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionsTab() {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Center(
        child: Text(
          'Bộ sưu tập sẽ được hiển thị ở đây',
          style: TextStyle(
            color: AppColors.netflixLightGrey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSimilarContentTab() {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Center(
        child: Text(
          'Nội dung tương tự sẽ được hiển thị ở đây',
          style: TextStyle(
            color: AppColors.netflixLightGrey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildTrailersTab() {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Center(
        child: Text(
          'Trailer sẽ được hiển thị ở đây',
          style: TextStyle(
            color: AppColors.netflixLightGrey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}