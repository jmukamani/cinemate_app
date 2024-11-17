# CineMate - Flutter Movie Explorer App

## Overview
CineMate is a modern Flutter application that allows users to explore trending movies, view detailed information about each movie, and maintain a personal watchlist. The app demonstrates best practices in Flutter development, including state management, API integration, and responsive UI design.

## Features
- Browse trending movies with a visually appealing grid layout
- View detailed information about each movie
- Add/remove movies to/from personal watchlist
- Responsive design that works across different screen sizes
- Error handling and offline state management
- Clean architecture with Provider state management

## Prerequisites
- Flutter SDK (2.0.0 or higher)
- Dart SDK (2.12.0 or higher)
- Android Studio / VS Code
- TMDB API Key (see API Setup section)

## Installation

1. Clone the repository
git clone https://github.com/jmukamani/cinemate_app.git
cd cinemate

2. Install dependencies
flutter pub get


3. Add your TMDB API key in `lib/providers/movie_provider.dart`
final String _apiKey = 'YOUR_API_KEY_HERE';


4. Run the app
flutter run

## API Setup

### TMDB API
This project uses The Movie Database (TMDB) API. To use the API:

1. Visit [TMDB Website](https://www.themoviedb.org/)
2. Create an account and sign in
3. Go to Settings -> API
4. Register for an API key
5. Copy the API key (v3 auth)

### API Endpoints Used

#### Trending Movies
GET https://api.themoviedb.org/3/trending/movie/week

Parameters:
- `api_key` (required): Your TMDB API key

Response Example:

{
  "results": [
    {
      "id": 123,
      "title": "Movie Title",
      "overview": "Movie description",
      "poster_path": "/path/to/poster.jpg",
      "vote_average": 7.5,
      "release_date": "2024-01-01"
    }
  ]
}


### Image URLs
Base URL for movie posters: `https://image.tmdb.org/t/p/w500`

## Project Structure

lib/
├── main.dart
├── models/
│   └── movie.dart
├── providers/
│   └── movie_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── movie_details_screen.dart
│   └── watchlist_screen.dart
└── widgets/
    └── movie_card.dart
 

## Key Components

### Screens

#### Home Screen
- Displays a grid of trending movies
- Implements pull-to-refresh
- Shows loading and error states
- Navigation to movie details

#### Movie Details Screen
- Parallax effect with movie poster
- Detailed movie information
- Add/remove from watchlist functionality

#### Watchlist Screen
- Displays user's saved movies
- Persistent storage
- Remove from watchlist functionality

### State Management
The app uses Provider package for state management:
- `MovieProvider`: Manages movie data and API calls
- Handles loading states and errors
- Manages watchlist functionality

## Dependencies

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  http: ^1.1.0


## Error Handling
The app implements comprehensive error handling:
- Network errors
- API response errors
- Image loading errors
- Empty states

## Performance Considerations
- Lazy loading of images
- Efficient state management
- Minimal rebuilds using Provider

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Acknowledgments
- TMDB for providing the movie data API

## Contact
Your Name - j.mukamani@alustudent.com
Project Link: https://github.com/jmukamani/cinemate_app.git


## Troubleshooting

### Common Issues

1. API Key Issues

// Check if API key is correctly set in movie_provider.dart
final String _apiKey = 'YOUR_API_KEY_HERE';


2. Image Loading Issues

// Ensure proper error handling in movie_card.dart
Image.network(
  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
  errorBuilder: (context, error, stackTrace) {
    return Container(
      color: Colors.grey,
      child: Icon(Icons.error),
    );
  },
)


3. State Management Issues

// Verify Provider setup in main.dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: CineMateApp(),
    ),
  );
}


## Future Enhancements
- Implement search functionality
- Add movie categories/genres
- Implement user authentication
- Add movie reviews and ratings
- Implement offline support
- Add movie trailers
- Implement social sharing features

## Version History
* 0.1
    * Initial Release
    * Basic functionality with trending movies and watchlist

## Design Decisions
- Material Design principles for consistent UI
- Dark theme for better movie browsing experience
- Grid layout for efficient space usage
- Responsive design for various screen sizes
