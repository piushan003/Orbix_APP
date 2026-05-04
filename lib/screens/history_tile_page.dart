// import 'package:flutter/material.dart';

// class HistoryTilePage extends StatelessWidget {
//   final VoidCallback onToggleTheme;
//   final DateTime selectedDate;

//   const HistoryTilePage({
//     super.key,
//     required this.onToggleTheme,
//     required this.selectedDate,
//   });

//   String _formatDate(DateTime date) {
//     final months = [
//       'January', 'February', 'March', 'April', 'May', 'June',
//       'July', 'August', 'September', 'October', 'November', 'December'
//     ];
//     return '${months[date.month - 1]} ${date.day}, ${date.year}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Top bar with title, date, and theme button
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'HISTORY',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'January 29, 2026',
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     onPressed: onToggleTheme,
//                     icon: Icon(
//                       isDark ? Icons.light_mode : Icons.dark_mode,
//                       size: 28,
//                     ),
//                     tooltip: 'Toggle Theme',
//                   ),
//                 ],
//               ),
//             ),

//             // Main scrollable content
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Back Button
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: TextButton.icon(
//                         onPressed: () => Navigator.pop(context),
//                         icon: const Icon(Icons.arrow_back),
//                         label: const Text('BACK'),
//                         style: TextButton.styleFrom(
//                           foregroundColor: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),

//                     // Historical Image
//                     Container(
//                       height: 300,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.surface,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 10,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               color: Theme.of(context).primaryColor.withOpacity(0.1),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.image,
//                                   size: 80,
//                                   color: Theme.of(context).primaryColor.withOpacity(0.5),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   'IMAGE',
//                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                                     color: Theme.of(context).primaryColor.withOpacity(0.7),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),

//                     // Date of the Image
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.surface,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                           color: Theme.of(context).primaryColor.withOpacity(0.3),
//                           width: 1,
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.calendar_today,
//                             size: 18,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             _formatDate(selectedDate),
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Description
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.surface,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'DESCRIPTION',
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             'This is the description of the astronomy picture from ${_formatDate(selectedDate)}. The description provides context and scientific information about the image captured on this specific date.',
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               height: 1.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Action Buttons
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Added to favorites!'),
//                                   duration: Duration(seconds: 2),
//                                 ),
//                               );
//                             },
//                             icon: const Icon(Icons.favorite_border, size: 20),
//                             label: const Text('ADD TO FAVORITES'),
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 14),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: OutlinedButton.icon(
//                             onPressed: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Downloading image...'),
//                                   duration: Duration(seconds: 2),
//                                 ),
//                               );
//                             },
//                             icon: const Icon(Icons.download, size: 20),
//                             label: const Text('DOWNLOAD'),
//                             style: OutlinedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 14),
//                               side: BorderSide(
//                                 color: Theme.of(context).primaryColor,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../services/apod_service.dart';
import '../services/favorites_service.dart';

class HistoryTilePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final DateTime selectedDate;

  const HistoryTilePage({
    super.key,
    required this.onToggleTheme,
    required this.selectedDate,
  });

  @override
  State<HistoryTilePage> createState() => _HistoryTilePageState();
}

class _HistoryTilePageState extends State<HistoryTilePage> {
  ApodData? _apodData;
  bool _isLoading = true;
  String? _errorMessage;
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
    _loadApodData();
  }

  Future<void> _loadApodData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final data = await ApodService.fetchApodByDate(widget.selectedDate);
    
    setState(() {
      _apodData = data;
      _isLoading = false;
      if (data == null) {
        _errorMessage = 'Failed to load image for this date. Please check your internet connection.';
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
    if (_apodData == null) return;

    if (_isFavorited) {
      // Remove from favorites
      final success = await FavoritesService.removeFavorite(_apodData!.date);
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
      final favoriteItem = FavoriteItem.fromApodData(_apodData!);
      final success = await FavoritesService.addFavorite(favoriteItem);
      
      if (success) {
        setState(() {
          _isFavorited = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to favorites!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Already in favorites'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
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
                        'HISTORY',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatDate(DateTime.now()),
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
                  ? const Center(child: CircularProgressIndicator())
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
                              const SizedBox(height: 12),
                              TextButton.icon(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text('GO BACK'),
                              ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Back Button
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton.icon(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text('BACK'),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),

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

                              // Historical Image
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
                              const SizedBox(height: 16),

                              // Copyright info
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

                              // Date of the Image
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _formatDate(widget.selectedDate),
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

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
                                      onPressed: _apodData != null
                                          ? () {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text('Downloading image...'),
                                                  duration: Duration(seconds: 2),
                                                ),
                                              );
                                            }
                                          : null,
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
                            ],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}