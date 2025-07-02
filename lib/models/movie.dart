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

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.year,
    required this.genre,
    this.isNetflixOriginal = false,
  });
}

// Sample data cho demo
class SampleData {
  static List<Movie> trendingMovies = [
    Movie(
      id: '1',
      title: 'Squid Game',
      imageUrl: 'https://image.tmdb.org/t/p/w500/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
      description: 'Hundreds of cash-strapped players accept a strange invitation to compete in children\'s games.',
      rating: 8.0,
      year: 2021,
      genre: 'Thriller',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '2',
      title: 'Money Heist',
      imageUrl: 'https://image.tmdb.org/t/p/w500/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
      description: 'An unusual group of robbers attempt to carry out the most perfect robbery in Spanish history.',
      rating: 8.2,
      year: 2017,
      genre: 'Crime',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '3',
      title: 'Stranger Things',
      imageUrl: 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
      description: 'When a young boy vanishes, a small town uncovers a mystery involving secret experiments.',
      rating: 8.7,
      year: 2016,
      genre: 'Sci-Fi',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '4',
      title: 'The Witcher',
      imageUrl: 'https://image.tmdb.org/t/p/w500/7vjaCdMw15FEbXyLQTVa04URsPm.jpg',
      description: 'Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny.',
      rating: 8.0,
      year: 2019,
      genre: 'Fantasy',
      isNetflixOriginal: true,
    ),
  ];

  static List<Movie> popularMovies = [
    Movie(
      id: '5',
      title: 'Wednesday',
      imageUrl: 'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
      description: 'Smart, sarcastic and a little dead inside, Wednesday Addams investigates murders.',
      rating: 8.1,
      year: 2022,
      genre: 'Comedy',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '6',
      title: 'The Crown',
      imageUrl: 'https://image.tmdb.org/t/p/w500/1M876KPjulVwppEpldhdc8V4o68.jpg',
      description: 'Follows the political rivalries and romance of Queen Elizabeth II\'s reign.',
      rating: 8.6,
      year: 2016,
      genre: 'Drama',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '7',
      title: 'Ozark',
      imageUrl: 'https://image.tmdb.org/t/p/w500/m73QiJOFMiJlowgBbHlNMrjQjfv.jpg',
      description: 'A financial advisor drags his family to the Missouri Ozarks to launder money.',
      rating: 8.4,
      year: 2017,
      genre: 'Crime',
      isNetflixOriginal: true,
    ),
  ];

  static List<Movie> actionMovies = [
    Movie(
      id: '8',
      title: 'Extraction',
      imageUrl: 'https://image.tmdb.org/t/p/w500/wlfDxbGEsW58vGhFljKkcR5XXOL.jpg',
      description: 'A black-market mercenary has nothing to lose when his skills are solicited.',
      rating: 6.7,
      year: 2020,
      genre: 'Action',
      isNetflixOriginal: true,
    ),
    Movie(
      id: '9',
      title: 'The Old Guard',
      imageUrl: 'https://image.tmdb.org/t/p/w500/cjr4NWURcVN3gW5FlHeabgBHLrY.jpg',
      description: 'A covert team of immortal mercenaries is suddenly exposed.',
      rating: 6.6,
      year: 2020,
      genre: 'Action',
      isNetflixOriginal: true,
    ),
  ];
}