import 'package:flutter/material.dart';

class AppColors {
  // Ana renkler
  static const Color primaryBrown = Color(0xFF5D4E37);
  static const Color darkBrown = Color(0xFF3C2F1F);
  static const Color lightBrown = Color(0xFF8B7355);
  
  // Altın sarısı
  static const Color goldYellow = Color(0xFFFFD700);
  static const Color lightGold = Color(0xFFFFF8DC);
  
  // Aksan renkler
  static const Color elvishGreen = Color(0xFF228B22);
  static const Color gondorBlue = Color(0xFF4169E1);
  static const Color mordorRed = Color(0xFF8B0000);
  
  // Arka plan renkleri
  static const Color parchment = Color(0xFFF5DEB3);
  static const Color lightParchment = Color(0xFFFAF0E6);
  
  // Metin renkleri
  static const Color darkText = Color(0xFF2F1B14);
  static const Color lightText = Color(0xFFFFFAF0);
  
  // Kategori renkleri
  static const Map<String, Color> categoryColors = {
    'elves': elvishGreen,
    'hobbits': Color(0xFF32CD32),
    'dwarves': Color(0xFF696969),
    'men': gondorBlue,
    'orcsAndDarkForces': mordorRed,
    'wizardsAndMaiar': Color(0xFF9370DB),
  };
  
  // Durum renkleri
  static const Color correct = Color(0xFF228B22);
  static const Color incorrect = Color(0xFFDC143C);
  static const Color warning = Color(0xFFFF8C00);
  static const Color info = Color(0xFF4682B4);
}
