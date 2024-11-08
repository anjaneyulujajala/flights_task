import 'package:devtask/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffC4E59E),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        scaffoldBackgroundColor: const Color(0xffF8F8F8)
      ),
      debugShowCheckedModeBanner: false,
      home: const SearchScreen(),
    );
  }
}
