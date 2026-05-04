// // import 'dart:convert';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'apod_service.dart'; 

// // class FavoritesService {
// //   static const String _favoritesKey = 'favorites';

// //   // Save a favorite
// //   static Future<bool> addFavorite(FavoriteItem item) async {
// //     try {
// //       final prefs = await SharedPreferences.getInstance();
// //       final favorites = await getFavorites();
      
// //       // Check if already exists
// //       final exists = favorites.any((fav) => fav.date == item.date);
// //       if (exists) {
// //         return false; // Already in favorites
// //       }
      
// //       favorites.add(item);
      
// //       final jsonList = favorites.map((fav) => fav.toJson()).toList();
// //       final jsonString = json.encode(jsonList);
      
// //       return await prefs.setString(_favoritesKey, jsonString);
// //     } catch (e) {
// //       print('Error adding favorite: $e');
// //       return false;
// //     }
// //   }

// //   // Remove a favorite
// //   static Future<bool> removeFavorite(String date) async {
// //     try {
// //       final prefs = await SharedPreferences.getInstance();
// //       final favorites = await getFavorites();
      
// //       favorites.removeWhere((fav) => fav.date == date);
      
// //       final jsonList = favorites.map((fav) => fav.toJson()).toList();
// //       final jsonString = json.encode(jsonList);
      
// //       return await prefs.setString(_favoritesKey, jsonString);
// //     } catch (e) {
// //       print('Error removing favorite: $e');
// //       return false;
// //     }
// //   }

// //   // Get all favorites
// //   static Future<List<FavoriteItem>> getFavorites() async {
// //     try {
// //       final prefs = await SharedPreferences.getInstance();
// //       final jsonString = prefs.getString(_favoritesKey);
      
// //       if (jsonString == null || jsonString.isEmpty) {
// //         return [];
// //       }
      
// //       final jsonList = json.decode(jsonString) as List;
// //       return jsonList.map((json) => FavoriteItem.fromJson(json)).toList();
// //     } catch (e) {
// //       print('Error getting favorites: $e');
// //       return [];
// //     }
// //   }

// //   // Check if an item is favorited
// //   static Future<bool> isFavorite(String date) async {
// //     final favorites = await getFavorites();
// //     return favorites.any((fav) => fav.date == date);
// //   }

// //   // Clear all favorites
// //   static Future<bool> clearAllFavorites() async {
// //     try {
// //       final prefs = await SharedPreferences.getInstance();
// //       return await prefs.remove(_favoritesKey);
// //     } catch (e) {
// //       print('Error clearing favorites: $e');
// //       return false;
// //     }
// //   }
// // }

// // class FavoriteItem {
// //   final String date;
// //   final String title;
// //   final String explanation;
// //   final String url;
// //   final String mediaType;
// //   final String? hdurl;
// //   final String? copyright;

// //   FavoriteItem({
// //     required this.date,
// //     required this.title,
// //     required this.explanation,
// //     required this.url,
// //     required this.mediaType,
// //     this.hdurl,
// //     this.copyright,
// //   });

// //   // Convert to JSON
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'date': date,
// //       'title': title,
// //       'explanation': explanation,
// //       'url': url,
// //       'media_type': mediaType,
// //       'hdurl': hdurl,
// //       'copyright': copyright,
// //     };
// //   }

// //   // Create from JSON
// //   factory FavoriteItem.fromJson(Map<String, dynamic> json) {
// //     return FavoriteItem(
// //       date: json['date'] ?? '',
// //       title: json['title'] ?? '',
// //       explanation: json['explanation'] ?? '',
// //       url: json['url'] ?? '',
// //       mediaType: json['media_type'] ?? 'image',
// //       hdurl: json['hdurl'],
// //       copyright: json['copyright'],
// //     );
// //   }

// //   // Create from ApodData
// //   factory FavoriteItem.fromApodData(ApodData apod) {
// //     return FavoriteItem(
// //       date: apod.date,
// //       title: apod.title,
// //       explanation: apod.explanation,
// //       url: apod.url,
// //       mediaType: apod.mediaType,
// //       hdurl: apod.hdurl,
// //       copyright: apod.copyright,
// //     );
// //   }
// // }

// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'apod_service.dart';

// class FavoritesService {
//   static const String _favoritesKey = 'favorites';

//   // Save a favorite
//   static Future<bool> addFavorite(FavoriteItem item) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final favorites = await getFavorites();
      
//       // Check if already exists
//       final exists = favorites.any((fav) => fav.date == item.date);
//       if (exists) {
//         return false; // Already in favorites
//       }
      
//       favorites.add(item);
      
//       final jsonList = favorites.map((fav) => fav.toJson()).toList();
//       final jsonString = json.encode(jsonList);
      
//       await prefs.setString(_favoritesKey, jsonString);
//       print('Saved favorites: $jsonString'); // Debug
//       return true;
//     } catch (e) {
//       print('Error adding favorite: $e');
//       return false;
//     }
//   }

//   // Remove a favorite
//   static Future<bool> removeFavorite(String date) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final favorites = await getFavorites();
      
//       favorites.removeWhere((fav) => fav.date == date);
      
//       final jsonList = favorites.map((fav) => fav.toJson()).toList();
//       final jsonString = json.encode(jsonList);
      
//       return await prefs.setString(_favoritesKey, jsonString);
//     } catch (e) {
//       print('Error removing favorite: $e');
//       return false;
//     }
//   }

//   // Get all favorites
//   static Future<List<FavoriteItem>> getFavorites() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final jsonString = prefs.getString(_favoritesKey);
      
//       print('Retrieved favorites: $jsonString'); // Debug
      
//       if (jsonString == null || jsonString.isEmpty) {
//         return [];
//       }
      
//       final jsonList = json.decode(jsonString) as List;
//       return jsonList.map((json) => FavoriteItem.fromJson(json)).toList();
//     } catch (e) {
//       print('Error getting favorites: $e');
//       return [];
//     }
//   }

//   // Check if an item is favorited
//   static Future<bool> isFavorite(String date) async {
//     final favorites = await getFavorites();
//     return favorites.any((fav) => fav.date == date);
//   }

//   // Clear all favorites
//   static Future<bool> clearAllFavorites() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return await prefs.remove(_favoritesKey);
//     } catch (e) {
//       print('Error clearing favorites: $e');
//       return false;
//     }
//   }
// }

// class FavoriteItem {
//   final String date;
//   final String title;
//   final String explanation;
//   final String url;
//   final String mediaType;
//   final String? hdurl;
//   final String? copyright;

//   FavoriteItem({
//     required this.date,
//     required this.title,
//     required this.explanation,
//     required this.url,
//     required this.mediaType,
//     this.hdurl,
//     this.copyright,
//   });

//   // Convert to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'date': date,
//       'title': title,
//       'explanation': explanation,
//       'url': url,
//       'media_type': mediaType,
//       'hdurl': hdurl,
//       'copyright': copyright,
//     };
//   }

//   // Create from JSON
//   factory FavoriteItem.fromJson(Map<String, dynamic> json) {
//     return FavoriteItem(
//       date: json['date'] ?? '',
//       title: json['title'] ?? '',
//       explanation: json['explanation'] ?? '',
//       url: json['url'] ?? '',
//       mediaType: json['media_type'] ?? 'image',
//       hdurl: json['hdurl'],
//       copyright: json['copyright'],
//     );
//   }

//   // Create from ApodData
//   factory FavoriteItem.fromApodData(ApodData apod) {
//     return FavoriteItem(
//       date: apod.date,
//       title: apod.title,
//       explanation: apod.explanation,
//       url: apod.url,
//       mediaType: apod.mediaType,
//       hdurl: apod.hdurl,
//       copyright: apod.copyright,
//     );
//   }
// }

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'apod_service.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorites';

  // Save a favorite
  static Future<bool> addFavorite(FavoriteItem item) async {
    try {
      print('=== ADD FAVORITE DEBUG ===');
      print('Attempting to add favorite with date: ${item.date}');
      
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();
      
      print('Current favorites count: ${favorites.length}');
      
      // Check if already exists
      final exists = favorites.any((fav) => fav.date == item.date);
      if (exists) {
        print('Item already exists in favorites');
        return false; // Already in favorites
      }
      
      favorites.add(item);
      print('Added item, new count: ${favorites.length}');
      
      final jsonList = favorites.map((fav) => fav.toJson()).toList();
      final jsonString = json.encode(jsonList);
      
      print('Saving to SharedPreferences...');
      final saveResult = await prefs.setString(_favoritesKey, jsonString);
      print('Save result: $saveResult');
      print('Saved JSON: $jsonString');
      
      // Verify it was saved
      final verification = prefs.getString(_favoritesKey);
      print('Verification read: $verification');
      
      return saveResult;
    } catch (e, stackTrace) {
      print('Error adding favorite: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  // Remove a favorite
  static Future<bool> removeFavorite(String date) async {
    try {
      print('=== REMOVE FAVORITE DEBUG ===');
      print('Removing favorite with date: $date');
      
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();
      
      print('Favorites before removal: ${favorites.length}');
      
      favorites.removeWhere((fav) => fav.date == date);
      
      print('Favorites after removal: ${favorites.length}');
      
      final jsonList = favorites.map((fav) => fav.toJson()).toList();
      final jsonString = json.encode(jsonList);
      
      return await prefs.setString(_favoritesKey, jsonString);
    } catch (e) {
      print('Error removing favorite: $e');
      return false;
    }
  }

  // Get all favorites
  static Future<List<FavoriteItem>> getFavorites() async {
    try {
      print('=== GET FAVORITES DEBUG ===');
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_favoritesKey);
      
      print('Raw JSON from storage: $jsonString');
      
      if (jsonString == null || jsonString.isEmpty) {
        print('No favorites found in storage');
        return [];
      }
      
      final jsonList = json.decode(jsonString) as List;
      final favorites = jsonList.map((json) => FavoriteItem.fromJson(json)).toList();
      
      print('Parsed ${favorites.length} favorites');
      
      return favorites;
    } catch (e, stackTrace) {
      print('Error getting favorites: $e');
      print('Stack trace: $stackTrace');
      return [];
    }
  }

  // Check if an item is favorited
  static Future<bool> isFavorite(String date) async {
    print('=== CHECK IS FAVORITE ===');
    print('Checking if date is favorite: $date');
    
    final favorites = await getFavorites();
    final isFav = favorites.any((fav) => fav.date == date);
    
    print('Is favorite result: $isFav');
    
    return isFav;
  }

  // Clear all favorites
  static Future<bool> clearAllFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_favoritesKey);
    } catch (e) {
      print('Error clearing favorites: $e');
      return false;
    }
  }
}

class FavoriteItem {
  final String date;
  final String title;
  final String explanation;
  final String url;
  final String mediaType;
  final String? hdurl;
  final String? copyright;

  FavoriteItem({
    required this.date,
    required this.title,
    required this.explanation,
    required this.url,
    required this.mediaType,
    this.hdurl,
    this.copyright,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'title': title,
      'explanation': explanation,
      'url': url,
      'media_type': mediaType,
      'hdurl': hdurl,
      'copyright': copyright,
    };
  }

  // Create from JSON
  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      date: json['date'] ?? '',
      title: json['title'] ?? '',
      explanation: json['explanation'] ?? '',
      url: json['url'] ?? '',
      mediaType: json['media_type'] ?? 'image',
      hdurl: json['hdurl'],
      copyright: json['copyright'],
    );
  }

  // Create from ApodData
  factory FavoriteItem.fromApodData(ApodData apod) {
    print('=== CREATE FAVORITE ITEM FROM APOD ===');
    print('Date: ${apod.date}');
    print('Title: ${apod.title}');
    print('URL: ${apod.url}');
    
    return FavoriteItem(
      date: apod.date,
      title: apod.title,
      explanation: apod.explanation,
      url: apod.url,
      mediaType: apod.mediaType,
      hdurl: apod.hdurl,
      copyright: apod.copyright,
    );
  }
}