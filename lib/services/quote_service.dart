import 'dart:math';
import 'package:flutter/services.dart';

class QuoteService {
  static List<Quote>? _quotes;

  // Load quotes from the text file
  static Future<void> loadQuotes() async {
    if (_quotes != null) return; // Already loaded

    try {
      final String data = await rootBundle.loadString('assets/quotes.txt');
      final lines = data.split('\n').where((line) => line.trim().isNotEmpty);
      
      _quotes = lines.map((line) {
        final parts = line.split('|');
        if (parts.length == 2) {
          return Quote(
            text: parts[0].trim(),
            author: parts[1].trim(),
          );
        }
        return Quote(text: line.trim(), author: 'Unknown');
      }).toList();
    } catch (e) {
      print('Error loading quotes: $e');
      _quotes = [
        Quote(
          text: 'The cosmos is within us. We are made of star-stuff.',
          author: 'Carl Sagan',
        ),
      ];
    }
  }

  // Get a random quote
  static Quote getRandomQuote() {
    if (_quotes == null || _quotes!.isEmpty) {
      return Quote(
        text: 'The cosmos is within us. We are made of star-stuff.',
        author: 'Carl Sagan',
      );
    }

    final random = Random();
    return _quotes![random.nextInt(_quotes!.length)];
  }
}

class Quote {
  final String text;
  final String author;

  Quote({
    required this.text,
    required this.author,
  });
}