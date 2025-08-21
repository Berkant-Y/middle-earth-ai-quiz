/*
 * PERFORMANCE UTILS - Performans Yardımcı Fonksiyonları
 * 
 * Quiz performansı, renk kodlaması ve başarı göstergelerini yöneten
 * yardımcı fonksiyonlar sınıfı. String constants kullanır.
 */

import 'package:flutter/material.dart';
import '../constants/semantic_colors.dart';
import '../constants/app_strings.dart';

class PerformanceUtils {
  // Private constructor - static sınıf
  PerformanceUtils._();

  // Skor yüzdesine göre semantic renk belirle
  static Color getScoreColor(double percentage) {
    if (percentage >= 90) return SemanticColors.state.excellent;
    if (percentage >= 70) return SemanticColors.state.good;
    if (percentage >= 50) return SemanticColors.state.average;
    return SemanticColors.state.poor;
  }

  // Performansa göre anlamsal ikon seç
  static IconData getPerformanceIcon(double percentage) {
    if (percentage >= 90) return Icons.emoji_events;
    if (percentage >= 70) return Icons.thumb_up;
    if (percentage >= 50) return Icons.sentiment_neutral;
    return Icons.sentiment_dissatisfied;
  }

  // Başarı yüzdesine göre string constant mesajı
  static String getPerformanceMessage(double percentage) {
    if (percentage >= 90) return AppStrings.performance.excellent;
    if (percentage >= 80) return AppStrings.performance.veryGood;
    if (percentage >= 70) return AppStrings.performance.goodJob;
    if (percentage >= 60) return AppStrings.performance.notBad;
    if (percentage >= 50) return AppStrings.performance.keepTrying;
    return AppStrings.performance.studyMore;
  }

  // Başarı yüzdesine göre detaylı açıklama (string constants)
  static String getPerformanceDescription(double percentage) {
    if (percentage >= 90) return AppStrings.performance.trueScholar;
    if (percentage >= 80) return AppStrings.performance.knowsWell;
    if (percentage >= 70) return AppStrings.performance.goodKnowledge;
    if (percentage >= 60) return AppStrings.performance.rereadBooks;
    if (percentage >= 50) return AppStrings.performance.brushUp;
    return AppStrings.performance.watchMovies;
  }

  // Notlandırma sistemi enum benzeri
  static String getGrade(double percentage) {
    if (percentage >= 90) return 'A';
    if (percentage >= 80) return 'B';
    if (percentage >= 70) return 'C';
    if (percentage >= 60) return 'D';
    return 'F';
  }

  // Performans seviyesi string constants ile
  static String getPerformanceLevel(double percentage) {
    if (percentage >= 90) return AppStrings.performance.masterLevel;
    if (percentage >= 80) return AppStrings.performance.expertLevel;
    if (percentage >= 70) return AppStrings.performance.advancedLevel;
    if (percentage >= 60) return AppStrings.performance.intermediateLevel;
    if (percentage >= 50) return AppStrings.performance.beginnerLevel;
    return AppStrings.performance.noviceLevel;
  }

  // Format yardımcıları - AppStrings methodları kullanır
  static String formatPercentage(double percentage) {
    return AppStrings.quiz.percentageFormat(percentage);
  }

  static String formatScore(int score, int total) {
    return AppStrings.quiz.outOf(score, total);
  }

  static String formatDuration(int seconds) {
    if (seconds < 60) {
      return '$seconds${AppStrings.general.seconds}';
    } else {
      double minutes = seconds / 60;
      return AppStrings.quiz.timeFormat(minutes);
    }
  }
}
