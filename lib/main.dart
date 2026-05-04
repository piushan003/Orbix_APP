import 'package:flutter/material.dart';
import 'screens/welcome_page.dart';
import 'utils/theme.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatefulWidget {
  const SpaceApp({super.key});

  @override
  State<SpaceApp> createState() => _SpaceAppState();
}

class _SpaceAppState extends State<SpaceApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Explorer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: WelcomePage(onToggleTheme: toggleTheme),
    );
  }
}