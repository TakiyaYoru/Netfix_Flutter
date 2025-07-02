// lib/models/movie.dart

class Movie {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final double rating;
  final int year;
  final String genre;
  final bool isNetflixOriginal;
  final String? badge; // Thêm badge như "Mùa mới", "Tập mới", "TOP 10"
  final int? ranking; // Thêm ranking cho Top 10 (1, 2, 3...)

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.year,
    required this.genre,
    this.isNetflixOriginal = false,
    this.badge,
    this.ranking,
  });
}

// Sample data với các categories mới
class SampleData {
  // Trending - Phim đang thịnh hành
  static List<Movie> trending = [
    Movie(
      id: '1',
      title: 'Trò chơi con mực',
      imageUrl: 'https://image.tmdb.org/t/p/w500/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
      description: 'Hàng trăm người chơi thiếu nợ chấp nhận lời mời kỳ lạ tham gia trò chơi trẻ em.',
      rating: 8.0,
      year: 2021,
      genre: 'Kinh dị',
      isNetflixOriginal: true,
      badge: 'Mùa mới',
    ),
    Movie(
      id: '2',
      title: 'Khi cuộc đời cho bạn quả quýt',
      imageUrl: 'https://image.tmdb.org/t/p/w500/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
      description: 'Câu chuyện tình yêu đầy cảm xúc giữa hai người trẻ.',
      rating: 8.2,
      year: 2023,
      genre: 'Tình cảm',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '3',
      title: 'Trung tâm chăm sóc',
      imageUrl: 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
      description: 'Bộ phim về cuộc sống của những người làm việc tại trung tâm y tế.',
      rating: 8.7,
      year: 2023,
      genre: 'Y khoa',
      isNetflixOriginal: true,
      badge: 'TOP 10',
    ),
    Movie(
      id: '4',
      title: 'Một Seoul chưa biết đến',
      imageUrl: 'https://image.tmdb.org/t/p/w500/7vjaCdMw15FEbXyLQTVa04URsPm.jpg',
      description: 'Khám phá những góc khuất của thành phố Seoul.',
      rating: 8.0,
      year: 2023,
      genre: 'Tài liệu',
      isNetflixOriginal: true,
    ),
  ];

  // Top 10 series tại Việt Nam hôm nay (có ranking)
  static List<Movie> top10Vietnam = [
    Movie(
      id: '5',
      title: 'Trò chơi con mực',
      imageUrl: 'https://image.tmdb.org/t/p/w500/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
      description: 'Hàng trăm người chơi thiếu nợ chấp nhận lời mời kỳ lạ.',
      rating: 8.1,
      year: 2021,
      genre: 'Kinh dị',
      isNetflixOriginal: true,
      ranking: 1,
      badge: 'Mùa mới',
    ),
    Movie(
      id: '6',
      title: 'Một Seoul chưa biết đến',
      imageUrl: 'https://image.tmdb.org/t/p/w500/1M876KPjulVwppEpldhdc8V4o68.jpg',
      description: 'Cuộc sống ở Seoul qua góc nhìn mới.',
      rating: 8.6,
      year: 2023,
      genre: 'Tài liệu',
      isNetflixOriginal: true,
      ranking: 2,
      badge: 'Tập mới',
    ),
    Movie(
      id: '7',
      title: 'Hoàng Tử Bé',
      imageUrl: 'https://image.tmdb.org/t/p/w500/m73QiJOFMiJlowgBbHlNMrjQjfv.jpg',
      description: 'Câu chuyện cổ tích được kể lại một cách hiện đại.',
      rating: 8.4,
      year: 2023,
      genre: 'Gia đình',
      isNetflixOriginal: true,
      ranking: 3,
      badge: 'Xem ngay',
    ),
  ];

  // Mới trên Netflix
  static List<Movie> newOnNetflix = [
    Movie(
      id: '8',
      title: 'Trò chơi con mực',
      imageUrl: 'https://image.tmdb.org/t/p/w500/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
      description: 'Series kinh dị nổi tiếng toàn cầu.',
      rating: 6.7,
      year: 2021,
      genre: 'Kinh dị',
      isNetflixOriginal: true,
      badge: 'Mùa mới',
    ),
    Movie(
      id: '9',
      title: 'The Witcher',
      imageUrl: 'https://image.tmdb.org/t/p/w500/cjr4NWURcVN3gW5FlHeabgBHLrY.jpg',
      description: 'Geralt của Rivia, thợ săn quái vật huyền thoại.',
      rating: 8.0,
      year: 2023,
      genre: 'Phiêu lưu',
      isNetflixOriginal: true,
      badge: 'TOP 10',
    ),
    Movie(
      id: '10',
      title: 'Wednesday',
      imageUrl: 'https://image.tmdb.org/t/p/w500/upKD8UbH8vQ798aMWgwMxV8t4yk.jpg',
      description: 'Cô gái Wednesday Addams và những bí ẩn.',
      rating: 8.9,
      year: 2023,
      genre: 'Kinh dị',
      isNetflixOriginal: true,
      badge: 'Tập mới',
    ),
  ];

  // Anime
  static List<Movie> anime = [
    Movie(
      id: '11',
      title: 'One Piece',
      imageUrl: 'https://image.tmdb.org/t/p/w500/cjr4NWURcVN3gW5FlHeabgBHLrY.jpg',
      description: 'Cuộc phiêu lưu của băng hải tặc Mũ Rơm.',
      rating: 9.0,
      year: 2023,
      genre: 'Anime',
      isNetflixOriginal: false,
      badge: 'TOP 10',
    ),
    Movie(
      id: '12',
      title: 'Thám tử lừng danh Conan',
      imageUrl: 'https://image.tmdb.org/t/p/w500/upKD8UbH8vQ798aMWgwMxV8t4yk.jpg',
      description: 'Thám tử nhí giải quyết những vụ án bí ẩn.',
      rating: 8.9,
      year: 2023,
      genre: 'Anime',
      isNetflixOriginal: false,
      badge: 'Tập mới',
    ),
    Movie(
      id: '13',
      title: 'Attack on Titan',
      imageUrl: 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
      description: 'Cuộc chiến chống lại những người khổng lồ.',
      rating: 9.1,
      year: 2023,
      genre: 'Anime',
      isNetflixOriginal: false,
    ),
    Movie(
      id: '14',
      title: 'Demon Slayer',
      imageUrl: 'https://image.tmdb.org/t/p/w500/7vjaCdMw15FEbXyLQTVa04URsPm.jpg',
      description: 'Tanjiro và cuộc hành trình săn quỷ.',
      rating: 8.8,
      year: 2023,
      genre: 'Anime',
      isNetflixOriginal: false,
    ),
  ];

  // Phim Mỹ lồng tiếng Việt  
  static List<Movie> americanMoviesVietnameseDub = [
    Movie(
      id: '15',
      title: 'Stranger Things',
      imageUrl: 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
      description: 'Những bí ẩn siêu nhiên ở thị trấn Hawkins.',
      rating: 8.7,
      year: 2016,
      genre: 'Khoa học viễn tưởng',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '16',
      title: 'The Witcher',
      imageUrl: 'https://image.tmdb.org/t/p/w500/7vjaCdMw15FEbXyLQTVa04URsPm.jpg',
      description: 'Geralt of Rivia, thợ săn quái vật huyền thoại.',
      rating: 8.0,
      year: 2019,
      genre: 'Phiêu lưu',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '17',
      title: 'The Crown',
      imageUrl: 'https://image.tmdb.org/t/p/w500/1M876KPjulVwppEpldhdc8V4o68.jpg',
      description: 'Cuộc đời của Hoàng gia Anh.',
      rating: 8.6,
      year: 2016,
      genre: 'Chính kịch',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '18',
      title: 'Money Heist',
      imageUrl: 'https://image.tmdb.org/t/p/w500/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
      description: 'Vụ cướp hoàn hảo ở Tây Ban Nha.',
      rating: 8.2,
      year: 2017,
      genre: 'Hành động',
      isNetflixOriginal: true,
    ),
  ];
}