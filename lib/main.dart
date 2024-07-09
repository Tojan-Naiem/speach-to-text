import 'package:flutter/material.dart';
import 'package:speach_to_text/HomePage.dart';

void main() {
  runApp(
    new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:  ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor:  Color.fromARGB(100, 545, 456, 564),
        surface: const Color.fromARGB(255, 58, 59, 59)
      ),
      
scaffoldBackgroundColor: Color.fromARGB(255, 25, 25, 25),
useMaterial3: true,
    ),
    
    home :HomePage(),
  ));
}
