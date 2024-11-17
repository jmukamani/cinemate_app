import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class MovieProvider with ChangeNotifier {
  final String _apiKey = 'YOUR_TMDB_API_KEY';
  final String _baseUrl = 'https://api.themoviedb.org/3';
  
  List<Movie> _trendingMovies = [];
  List<Movie> _watchlist = [];
  
  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> get watchlist => _watchlist;

  // Fetch trending movies from TMDB API
  Future<void> fetchTrendingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/trending/movie/week?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _trendingMovies = (data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (error) {
      print('Error fetching trending movies: $error');
      rethrow;
    }
  }

  // Toggle movie watchlist status
  void toggleWatchlist(Movie movie) {
    movie.isInWatchlist = !movie.isInWatchlist;
    if (movie.isInWatchlist) {
      _watchlist.add(movie);
    } else {
      _watchlist.removeWhere((m) => m.id == movie.id);
    }
    notifyListeners();
  }
}