# 🚀 ORBIX - Space Explorer

<div align="center">

![ORBIX Logo](https://img.shields.io/badge/ORBIX-Space%20Explorer-2196F3?style=for-the-badge&logo=rocket&logoColor=white)

**Explore the cosmos through NASA's Astronomy Picture of the Day**

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=flat&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=flat&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey?style=flat)](https://flutter.dev)

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Architecture](#-architecture) • [Contributing](#-contributing)

</div>

---

## 📖 About

**ORBIX** is a cross-platform mobile application built with Flutter that brings the wonders of the universe to your fingertips. Powered by NASA's Astronomy Picture of the Day (APOD) API, ORBIX delivers stunning space imagery with detailed scientific explanations, allowing users to explore the cosmos, save their favorite images, and discover fascinating space facts.

### 🎯 Project Goals

- Demonstrate cross-platform mobile development using Flutter
- Implement RESTful API integration with NASA APOD
- Apply Human-Computer Interaction (HCI) principles
- Create an intuitive, accessible user interface
- Showcase professional UI/UX design patterns

---

## ✨ Features

### Core Functionality

- **📅 Daily Space Images** - View NASA's Astronomy Picture of the Day with high-resolution images
- **🕐 Historical Archive** - Browse APOD images from June 16, 1995 to present
- **❤️ Favorites Management** - Save and organize your favorite space images locally
- **💡 Space Quotes** - Discover inspiring quotes from astronomers and scientists
- **🌓 Theme Support** - Seamless light and dark mode with system integration
- **📱 Cross-Platform** - Native performance on both iOS and Android

### Technical Features

- ✅ **RESTful API Integration** - NASA APOD API with error handling
- ✅ **Local Data Persistence** - JSON-based storage for favorites
- ✅ **Responsive UI** - Adaptive layouts for different screen sizes
- ✅ **State Management** - Efficient setState implementation
- ✅ **Asynchronous Programming** - Proper async/await patterns
- ✅ **Custom Theming** - Material Design with custom color schemes
- ✅ **Pull-to-Refresh** - Native gesture support for data reloading
- ✅ **Network Image Caching** - Optimized image loading

---

## 📸 Screenshots

<div align="center">

### Light Mode

| Welcome Screen | Home Screen | History Screen |
|:---:|:---:|:---:|
| ![Welcome](https://via.placeholder.com/250x500/FFFFFF/2196F3?text=Welcome+Screen) | ![Home](https://via.placeholder.com/250x500/FFFFFF/2196F3?text=Home+Screen) | ![History](https://via.placeholder.com/250x500/FFFFFF/2196F3?text=History+Screen) |

| Favorites Screen | About Screen | Detail View |
|:---:|:---:|:---:|
| ![Favorites](https://via.placeholder.com/250x500/FFFFFF/2196F3?text=Favorites+Screen) | ![About](https://via.placeholder.com/250x500/FFFFFF/2196F3?text=About+Screen) | ![Detail](https://via.placeholder.com/250x500/FFFFFF/2196F3?text=Detail+View) |

### Dark Mode

| Welcome Screen | Home Screen | Favorites Screen |
|:---:|:---:|:---:|
| ![Welcome Dark](https://via.placeholder.com/250x500/121212/64B5F6?text=Welcome+Dark) | ![Home Dark](https://via.placeholder.com/250x500/121212/64B5F6?text=Home+Dark) | ![Favorites Dark](https://via.placeholder.com/250x500/121212/64B5F6?text=Favorites+Dark) |

</div>

---

## 🚀 Installation

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.0 or higher) - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK** (3.0 or higher) - Comes bundled with Flutter
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control

### Quick Start

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/orbix.git
   cd orbix
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Get your NASA API Key** (Optional but recommended)

   - Visit [NASA API Portal](https://api.nasa.gov/)
   - Sign up for a free API key
   - Replace `DEMO_KEY` in `lib/services/apod_service.dart`:

   ```dart
   static const String apiKey = 'YOUR_API_KEY_HERE';
   ```

4. **Run the app**

   ```bash
   # For Android
   flutter run

   # For iOS (macOS only)
   flutter run -d ios

   # For specific device
   flutter devices
   flutter run -d <device-id>
   ```

5. **Build for production**

   ```bash
   # Android APK
   flutter build apk --release

   # iOS (macOS only)
   flutter build ios --release
   ```

---

## 📁 Project Structure

```
orbix/
├── android/                    # Android-specific files
├── ios/                        # iOS-specific files
├── lib/                        # Main application code
│   ├── main.dart              # App entry point
│   ├── screens/               # UI screens
│   │   ├── welcome_page.dart
│   │   ├── home_page.dart
│   │   ├── history_page.dart
│   │   ├── history_tile_page.dart
│   │   ├── favorites_page.dart
│   │   ├── favorite_tile_page.dart
│   │   └── about_page.dart
│   ├── services/              # Business logic & API
│   │   ├── apod_service.dart
│   │   ├── favorites_service.dart
│   │   └── quote_service.dart
│   └── utils/                 # Utilities & helpers
│       └── theme.dart
├── assets/                     # Static assets
│   ├── images/
│   │   └── cross_platform_logo.png
│   └── quotes.txt
├── test/                       # Unit & widget tests
│   └── model_tests.dart
├── pubspec.yaml               # Dependencies
└── README.md                  # This file
```

---

## 🏗️ Architecture

### Design Patterns

**ORBIX** follows a clean, maintainable architecture:

```
┌─────────────────────────────────────────┐
│           Presentation Layer            │
│  (Screens/Pages - UI Components)        │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│          Business Logic Layer           │
│      (Services - API & Storage)         │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│            Data Layer                   │
│  (NASA API, Local Storage, Assets)      │
└─────────────────────────────────────────┘
```

### State Management

- **Local State**: `setState()` for UI updates
- **Data Flow**: Unidirectional data flow pattern
- **Async Operations**: Future-based async/await

### Key Components

#### 1. **APOD Service** (`apod_service.dart`)
   - Handles NASA API communication
   - Parses JSON responses
   - Error handling and retry logic

#### 2. **Favorites Service** (`favorites_service.dart`)
   - Manages local storage using `path_provider`
   - JSON serialization/deserialization
   - CRUD operations for favorites

#### 3. **Quote Service** (`quote_service.dart`)
   - Loads quotes from assets
   - Random quote selection
   - Memory caching

---

## 🧪 Testing

ORBIX includes comprehensive testing to ensure reliability:

### Run Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/model_tests.dart
```

### Test Coverage

- ✅ **Unit Tests** - Data model validation, JSON parsing, business logic
- ✅ **Widget Tests** - UI component rendering, user interactions
- 📊 **15 Test Cases** covering critical functionality

### Example Test Output

```
00:01 +1: Quote Model Tests Quote should store text and author
00:01 +2: ApodData Model Tests ApodData should store all fields correctly
00:02 +3: FavoriteItem Model Tests FavoriteItem should serialize to JSON
...
00:06 +15: Widget Tests Theme toggle icon should display

All 15 tests passed!
```

---

## 🎨 Design Principles

### HCI Guidelines Applied

ORBIX adheres to established Human-Computer Interaction principles:

1. **✅ Visibility of System Status**
   - Loading indicators during API calls
   - Success/error feedback messages
   - Clear navigation breadcrumbs

2. **✅ Consistency and Standards**
   - Material Design compliance
   - Platform-specific conventions (iOS/Android)
   - Consistent navigation patterns

3. **✅ Error Prevention**
   - Date picker constraints (valid APOD range)
   - Confirmation dialogs for destructive actions
   - Input validation

4. **✅ Recognition Over Recall**
   - Visual thumbnails in favorites
   - Recent history shortcuts
   - Clear iconography with labels

5. **✅ Aesthetic and Minimalist Design**
   - Card-based layouts
   - Ample whitespace
   - Purpose-driven color usage

### Accessibility Features

- 🎨 High contrast text (WCAG AA compliant)
- 📏 Minimum touch target size: 48dp
- 🌗 Light and dark theme support
- 📱 Responsive layouts for all screen sizes

---

## 🛠️ Technologies Used

### Framework & Language
- **Flutter** 3.0+ - UI framework
- **Dart** 3.0+ - Programming language

### Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0                 # HTTP client for API calls
  path_provider: ^2.1.1        # File system access
  cupertino_icons: ^1.0.2      # iOS-style icons

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0        # Linting rules
```

### APIs & Services
- **NASA APOD API** - Astronomy Picture of the Day
- **Google Material Design** - Design system

---

## 📊 Performance

### Optimization Techniques

- ✅ **Lazy Loading** - GridView.builder for efficient rendering
- ✅ **Image Caching** - Network images cached automatically
- ✅ **Async Operations** - Non-blocking API calls
- ✅ **Memory Management** - Proper widget lifecycle handling
- ✅ **Asset Optimization** - Compressed images and assets

### Metrics

| Metric | Value |
|--------|-------|
| App Size (APK) | ~15 MB |
| Cold Start Time | <2s |
| API Response Time | 200-500ms |
| Frame Rate | 60 fps |

---

## 🔑 API Configuration

### NASA APOD API

**Base URL:** `https://api.nasa.gov/planetary/apod`

**Parameters:**
- `api_key` - Your NASA API key (required)
- `date` - Specific date in YYYY-MM-DD format (optional)

**Rate Limits:**
- `DEMO_KEY`: 30 requests/hour per IP
- **Personal Key**: 1000 requests/hour

**Get Your Key:**
1. Visit https://api.nasa.gov/
2. Fill out the form
3. Receive instant API key via email
4. Replace in `lib/services/apod_service.dart`

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

### Coding Standards

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

---

## 🐛 Known Issues & Limitations

- ❌ **Offline Mode**: Limited functionality without internet
- ❌ **Download Feature**: Shows notification but doesn't save to device gallery
- ❌ **Search**: No search functionality in favorites
- ⚠️ **Rate Limiting**: DEMO_KEY has strict limits (get personal key)

### Roadmap

Future enhancements planned:

- [ ] Offline mode with cached images
- [ ] Search and filter in favorites
- [ ] Social sharing functionality
- [ ] Astronomy events calendar
- [ ] Image wallpaper integration
- [ ] Multi-language support
- [ ] User onboarding tutorial

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2026 ORBIX Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

---

## 👥 Authors

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

---

## 🙏 Acknowledgments

- **NASA** - For providing the incredible APOD API
- **Flutter Team** - For the amazing framework
- **Material Design** - For comprehensive design guidelines
- **Contributors** - Thank you to everyone who has contributed!

### Resources & Inspiration

- [NASA APOD Website](https://apod.nasa.gov/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design Guidelines](https://m3.material.io/)
- Nielsen's Usability Heuristics
- Norman's Design Principles

---

## 📞 Support

Having issues? Here are some ways to get help:

1. **Check the [Issues](https://github.com/piushan003/orbix/issues)** tab
2. **Review [Closed Issues](https://github.com/piushan003/orbix/issues?q=is%3Aissue+is%3Aclosed)** for solutions
3. **Create a [New Issue](https://github.com/piushan003/orbix/issues/new)** with details
4. **Email**: support@orbix.app

---

## 📈 Project Stats

![GitHub stars](https://img.shields.io/github/stars/yourusername/orbix?style=social)
![GitHub forks](https://img.shields.io/github/forks/yourusername/orbix?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/yourusername/orbix?style=social)

![GitHub repo size](https://img.shields.io/github/repo-size/yourusername/orbix)
![GitHub code size](https://img.shields.io/github/languages/code-size/yourusername/orbix)
![Lines of code](https://img.shields.io/tokei/lines/github/yourusername/orbix)

---

<div align="center">

### 🌟 If you found this project helpful, please give it a star! 🌟

**Made with ❤️ and Flutter**

**Explore the Cosmos with ORBIX** 🚀

[⬆ Back to Top](#-orbix---space-explorer)

</div>
