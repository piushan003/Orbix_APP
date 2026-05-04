// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApodService {
//   // NASA APOD API endpoint
//   static const String apiKey = 'DEMO_KEY'; // Replace with your actual API key from https://api.nasa.gov/
//   static const String baseUrl = 'https://api.nasa.gov/planetary/apod';

//   // Fetch today's APOD
//   static Future<ApodData?> fetchTodayApod() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl?api_key=$apiKey'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return ApodData.fromJson(data);
//       } else {
//         print('Failed to load APOD: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching APOD: $e');
//       return null;
//     }
//   }

//   // Fetch APOD for a specific date
//   static Future<ApodData?> fetchApodByDate(DateTime date) async {
//     try {
//       final formattedDate = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      
//       final response = await http.get(
//         Uri.parse('$baseUrl?api_key=$apiKey&date=$formattedDate'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return ApodData.fromJson(data);
//       } else {
//         print('Failed to load APOD for date $formattedDate: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching APOD by date: $e');
//       return null;
//     }
//   }
// }

// // Model class for APOD data
// class ApodData {
//   final String title;
//   final String explanation;
//   final String url;
//   final String mediaType;
//   final String date;
//   final String? hdurl;
//   final String? copyright;

//   ApodData({
//     required this.title,
//     required this.explanation,
//     required this.url,
//     required this.mediaType,
//     required this.date,
//     this.hdurl,
//     this.copyright,
//   });

//   factory ApodData.fromJson(Map<String, dynamic> json) {
//     return ApodData(
//       title: json['title'] ?? '',
//       explanation: json['explanation'] ?? '',
//       url: json['url'] ?? '',
//       mediaType: json['media_type'] ?? 'image',
//       date: json['date'] ?? '',
//       hdurl: json['hdurl'],
//       copyright: json['copyright'],
//     );
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApodService {
  // NASA APOD API endpoint
  static const String apiKey = 'hkvTFTx9msK8MF8GCULKkQVDXxdn3rk2tGDS2XFD'; // Replace with your actual API key from https://api.nasa.gov/
  static const String baseUrl = 'https://api.nasa.gov/planetary/apod';

  // Fetch today's APOD
  static Future<ApodData?> fetchTodayApod() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?api_key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ApodData.fromJson(data);
      } else {
        print('Failed to load APOD: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching APOD: $e');
      return null;
    }
  }

  // Fetch APOD for a specific date
  static Future<ApodData?> fetchApodByDate(DateTime date) async {
    try {
      final formattedDate = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      
      final response = await http.get(
        Uri.parse('$baseUrl?api_key=$apiKey&date=$formattedDate'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ApodData.fromJson(data);
      } else {
        print('Failed to load APOD for date $formattedDate: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching APOD by date: $e');
      return null;
    }
  }
}

// Model class for APOD data
class ApodData {
  final String title;
  final String explanation;
  final String url;
  final String mediaType;
  final String date;
  final String? hdurl;
  final String? copyright;

  ApodData({
    required this.title,
    required this.explanation,
    required this.url,
    required this.mediaType,
    required this.date,
    this.hdurl,
    this.copyright,
  });

  factory ApodData.fromJson(Map<String, dynamic> json) {
    return ApodData(
      title: json['title'] ?? '',
      explanation: json['explanation'] ?? '',
      url: json['url'] ?? '',
      mediaType: json['media_type'] ?? 'image',
      date: json['date'] ?? '',
      hdurl: json['hdurl'],
      copyright: json['copyright'],
    );
  }
}