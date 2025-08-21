/*
 * NAVIGATION SERVICE - Navigasyon Hizmet Sınıfı
 * 
 * Tüm navigasyon işlemlerini merkezi olarak yöneten service sınıfı.
 * Kod tekrarını önler ve navigasyon mantığını business logic'ten ayırır.
 * 
 * Özellikler:
 * - Sayfa geçişleri (push, pop, replace)
 * - Quiz sonuç sayfası navigasyonu
 * - Karakter detay navigasyonu
 * - Profil sayfası navigasyonu
 * - Ana menü navigasyonu
 */

import 'package:flutter/material.dart';
import '../screens/character_detail_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/quiz_result_screen.dart';
import '../screens/main_menu_screen.dart';
import '../models/character.dart';
import '../models/quiz_result.dart';

// Navigasyon Service - merkezi navigasyon yönetimi
class NavigationService {
  // Karakter detay sayfasına git
  static void toCharacterDetail(BuildContext context, String characterId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailScreen(characterId: characterId),
      ),
    );
  }

  // Profil sayfasına git
  static void toProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  // Quiz sayfasına git
  static void toQuiz(BuildContext context, {CharacterCategory? category}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(category: category),
      ),
    );
  }

  // Quiz sonuç sayfasına git (replace ile)
  static void toQuizResult(BuildContext context, {
    required int score,
    required int totalQuestions,
    required String category,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          score: score,
          totalQuestions: totalQuestions,
          category: category,
        ),
      ),
    );
  }

  // Ana menüye geri dön (quiz sonuçlarından)
  static void backToMainMenu(BuildContext context) {
    Navigator.of(context).pop(); // Quiz result sayfasından çık
    Navigator.of(context).pop(); // Quiz sayfasından çık
  }

  // Quiz'i tekrar başlat
  static void restartQuiz(BuildContext context, {CharacterCategory? category}) {
    Navigator.of(context).pop(); // Sonuç sayfasından çık
    toQuiz(context, category: category); // Yeni quiz başlat
  }

  // Ana menüye replace ile git (splash'tan)
  static void toMainMenuFromSplash(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainMenuScreen(),
      ),
    );
  }

  // Geri git (basit pop)
  static void back(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Dialog kapat
  static void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Quiz'ten çık (dialog + quiz sayfası)
  static void exitQuiz(BuildContext context) {
    Navigator.of(context).pop(); // Dialog kapat
    Navigator.of(context).pop(); // Quiz sayfasından çık
  }
}
