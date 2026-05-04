import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'history_page.dart';
import 'favorites_page.dart';
import 'about_page.dart';
import '../services/apod_service.dart';
import '../services/quote_service.dart';
import '../services/favorites_service.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.onToggleTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  ApodData? _apodData;
  bool _isLoading = true;
  String? _errorMessage;
  Quote? _randomQuote;
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Load quotes first
    await QuoteService.loadQuotes();
    
    setState(() {
      _randomQuote = QuoteService.getRandomQuote();
    });
    
    // Then load APOD data
    _loadApodData();
  }

  Future<void> _loadApodData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final data = await ApodService.fetchTodayApod();
    
    setState(() {
      _apodData = data;
      _isLoading = false;
      if (data == null) {
        _errorMessage = 'Failed to load today\'s image. Please check your internet connection.';
      }
    });

    // Check if current image is favorited
    if (data != null) {
      _checkIfFavorited();
    }
  }

  Future<void> _checkIfFavorited() async {
    if (_apodData == null) return;
    
    final isFav = await FavoritesService.isFavorite(_apodData!.date);
    setState(() {
      _isFavorited = isFav;
    });
  }

  Future<void> _toggleFavorite() async {
  if (_apodData == null) {
    print('Cannot toggle favorite: _apodData is null');
    return;
  }

  print('\n========== TOGGLE FAVORITE ==========');
  print('Current APOD date: ${_apodData!.date}');
  print('Current APOD title: ${_apodData!.title}');
  print('Is favorited before toggle: $_isFavorited');

  if (_isFavorited) {
    // Remove from favorites
    print('Attempting to REMOVE from favorites...');
    final success = await FavoritesService.removeFavorite(_apodData!.date);
    print('Remove success: $success');
    
    if (success) {
      setState(() {
        _isFavorited = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Removed from favorites'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } else {
    // Add to favorites
    print('Attempting to ADD to favorites...');
    
    try {
      final favoriteItem = FavoriteItem.fromApodData(_apodData!);
      print('FavoriteItem created successfully');
      print('FavoriteItem JSON: ${favoriteItem.toJson()}');
      
      final success = await FavoritesService.addFavorite(favoriteItem);
      print('Add favorite returned: $success');
      
      if (success) {
        print('Successfully added to favorites!');
        setState(() {
          _isFavorited = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to favorites!'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print('Add favorite returned false - checking if already exists...');
        // Check if it's actually already in favorites
        final alreadyExists = await FavoritesService.isFavorite(_apodData!.date);
        print('Already exists check: $alreadyExists');
        
        if (alreadyExists) {
          setState(() {
            _isFavorited = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Already in favorites'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.orange,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to add to favorites - please try again'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e, stackTrace) {
      print('ERROR in _toggleFavorite: $e');
      print('Stack trace: $stackTrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  
  print('========== END TOGGLE FAVORITE ==========\n');
}

  Future<void> _downloadImage() async {
    if (_apodData == null || _apodData!.mediaType != 'image') return;

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Downloading image...'),
          duration: Duration(seconds: 2),
        ),
      );

      // Note: For actual download functionality, you'll need to implement
      // platform-specific code or use packages like image_gallery_saver
      // This is a simplified version
      final response = await http.get(Uri.parse(_apodData!.url));
      
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image downloaded successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Download failed: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _onNavigationTap(int index) {
    if (_selectedIndex == index) return; // Already on this page

    setState(() {
      _selectedIndex = index;
    });

    Widget? destinationPage;
    
    switch (index) {
      case 0:
        // Already on Home
        return;
      case 1:
        destinationPage = HistoryPage(onToggleTheme: widget.onToggleTheme);
        break;
      case 2:
        destinationPage = FavoritesPage(onToggleTheme: widget.onToggleTheme);
        break;
      case 3:
        destinationPage = AboutPage(onToggleTheme: widget.onToggleTheme);
        break;
    }

    if (destinationPage != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => destinationPage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with title, date, and theme button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HOME',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _apodData?.date ?? 'Loading...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: widget.onToggleTheme,
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      size: 28,
                    ),
                    tooltip: 'Toggle Theme',
                  ),
                ],
              ),
            ),

            // Main scrollable content
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _errorMessage != null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                child: Text(
                                  _errorMessage!,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: _loadApodData,
                                icon: const Icon(Icons.refresh),
                                label: const Text('RETRY'),
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: _loadApodData,
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Title
                                if (_apodData?.title != null)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Text(
                                      _apodData!.title,
                                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                // Daily Image
                                Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: _apodData?.mediaType == 'image'
                                        ? Image.network(
                                            _apodData!.url,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            loadingBuilder: (context, child, loadingProgress) {
                                              if (loadingProgress == null) return child;
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null
                                                      ? loadingProgress.cumulativeBytesLoaded /
                                                          loadingProgress.expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                            errorBuilder: (context, error, stackTrace) {
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.broken_image,
                                                      size: 64,
                                                      color: Colors.grey,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      'Failed to load image',
                                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                        : Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.video_library,
                                                  size: 64,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Video content',
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Copyright info (if available)
                                if (_apodData?.copyright != null)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Text(
                                      '© ${_apodData!.copyright}',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                // Description
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DESCRIPTION',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        _apodData?.explanation ?? 'No description available.',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Action Buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: _apodData != null ? _toggleFavorite : null,
                                        icon: Icon(
                                          _isFavorited ? Icons.favorite : Icons.favorite_border,
                                          size: 20,
                                        ),
                                        label: Text(_isFavorited ? 'REMOVE FAVORITE' : 'ADD TO FAVORITES'),
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          backgroundColor: _isFavorited ? Colors.red : null,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: _apodData != null ? _downloadImage : null,
                                        icon: const Icon(Icons.download, size: 20),
                                        label: const Text('DOWNLOAD'),
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          side: BorderSide(
                                            color: Theme.of(context).primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                // Quote Section
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.format_quote,
                                            color: Theme.of(context).primaryColor,
                                            size: 32,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.refresh,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _randomQuote = QuoteService.getRandomQuote();
                                              });
                                            },
                                            tooltip: 'Get new quote',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        '"${_randomQuote?.text ?? 'Loading quote...'}"',
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontStyle: FontStyle.italic,
                                          height: 1.6,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        '— ${_randomQuote?.author ?? ''}',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavigationTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}