/*
 * QUIZ RESULT SCREEN - Quiz Sonuç Ekranı
 * 
 * Kullanıcının quiz sonuçlarını gösteren sayfa.
 */

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String? category;

  const QuizResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / totalQuestions * 100).round();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.strings.quizComplete),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.amber,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B4513),
              Color(0xFF654321),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: AppConstants.padding.large,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Score Circle
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$score/$totalQuestions',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      Text(
                        '%$percentage',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Performance Message
                Text(
                  _getPerformanceMessage(percentage),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 20),
                
                // Category (sadece varsa göster)
                if (category != null) ...[
                  Text(
                    '${AppConstants.strings.category}: $category',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                
                const SizedBox(height: 40),
                
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[600],
                        foregroundColor: Colors.white,
                      ),
                      child: Text(AppConstants.strings.backToMenu),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                        foregroundColor: Colors.white,
                      ),
                      child: Text(AppConstants.strings.tryAgain),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getPerformanceMessage(int percentage) {
    if (percentage >= 90) return AppConstants.strings.excellent;
    if (percentage >= 80) return AppConstants.strings.veryGood;
    if (percentage >= 70) return AppConstants.strings.good;
    if (percentage >= 60) return AppConstants.strings.notBad;
    if (percentage >= 50) return AppConstants.strings.needsImprovement;
    return AppConstants.strings.studyMore;
  }
}
