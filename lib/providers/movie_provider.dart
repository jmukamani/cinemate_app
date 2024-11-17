import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class MovieProvider with ChangeNotifier {
  final String _apiKey = '7e184798a033a42d38101e41ec093464';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  List<Movie> _trendingMovies = [];
  List<Movie> _watchlist = [];
  bool _isLoading = false;
  String? _error;

  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> get watchlist => _watchlist;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch trending movies from TMDB API
  Future<void> fetchTrendingMovies() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Print the URL for debugging
      final url = '$_baseUrl/trending/movie/week?api_key=$_apiKey';
      print('Fetching movies from: $url');

      final response = await http.get(Uri.parse(url));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _trendingMovies = (data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();

        print('Fetched ${_trendingMovies.length} movies');
        _error = null;
      } else {
        throw Exception(
            'Failed to load trending movies. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching trending movies: $error');
      _error = error.toString();
      _trendingMovies = [];
    } finally {
      _isLoading = false;
      notifyListeners();
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
