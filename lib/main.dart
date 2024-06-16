import 'package:flutter/material.dart';
import 'package:insta_clone/screens/main_screen.dart';

void main() {
  runApp(const App());
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    primaryContainer: Color(0xff000000),
  ),
);

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      title: 'InstagramClone',
      home: const MainScreen(),
    );
  }
}
