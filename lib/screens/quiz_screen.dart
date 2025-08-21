/*
 * QUIZ SCREEN - Quiz Ekranı
 * 
 * Ana quiz oyun ekranı. Kullanıcıların seçilen kategoriye göre 
 * sorulara cevap verdiği ana oyun arayüzü.
 * 
 * Özellikler:
 * - Kategori bazlı soru sistemi
 * - Çoktan seçmeli sorular
 * - Cevap açıklamaları
 * - İlerleme çubuğu
 * - Puan takibi
 * - Zaman ölçümü
 * - Sonuç ekranına yönlendirme
 * - Responsive tasarım
 * - Provider pattern ile state yönetimi
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../utils/app_colors.dart';
import '../providers/quiz_provider.dart';
import '../providers/user_provider.dart';
import '../models/character.dart';
import 'quiz_result_screen.dart';

// Quiz Widget - ana quiz oyun ekranı
class QuizScreen extends StatefulWidget {
  // Seçilen karakter kategorisi (opsiyonel - null ise genel quiz)
  final CharacterCategory? category;
  
  const QuizScreen({super.key, this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

// Quiz State - oyun durumu ve etkileşim yönetimi
class _QuizScreenState extends State<QuizScreen> {
  // Seçilen cevap indeksi
  int? _selectedAnswerIndex;
  // Açıklama gösterilip gösterilmediği
  bool _showExplanation = false;

  @override
  void initState() {
    super.initState();
    // Quiz'i başlat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final quizProvider = Provider.of<QuizProvider>(context, listen: false);
      quizProvider.startQuiz(widget.category);
    });
  }

  // Cevap seçme fonksiyonu
  void _selectAnswer(int index) {
    if (_selectedAnswerIndex != null) return; // Zaten seçildi ise işlem yapma
    
    setState(() {
      _selectedAnswerIndex = index;
      _showExplanation = true; // Açıklamayı göster
    });
  }

  void _nextQuestion() {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    
    if (_selectedAnswerIndex != null) {
      if (quizProvider.isLastQuestion) {
        // Son soru - Quiz'i bitir
        quizProvider.answerLastQuestion(_selectedAnswerIndex!);
        final result = quizProvider.finishQuiz();
        if (result != null) {
          final userProvider = Provider.of<UserProvider>(context, listen: false);
          userProvider.updateQuizResults(result);
          
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => QuizResultScreen(
                score: result.score,
                totalQuestions: result.totalQuestions,
              ),
            ),
          );
        }
      } else {
        // Normal soru - sonraki soruya geç
        quizProvider.answerQuestion(_selectedAnswerIndex!);
        setState(() {
          _selectedAnswerIndex = null;
          _showExplanation = false;
        });
      }
    }
  }

  void _quitQuiz() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppConstants.strings.quitQuiz,
          style: GoogleFonts.cinzel(fontWeight: FontWeight.bold),
        ),
        content: Text(
          AppConstants.strings.quitQuizMessage,
          style: GoogleFonts.roboto(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppConstants.strings.continue_),
          ),
          TextButton(
            onPressed: () {
              final quizProvider = Provider.of<QuizProvider>(context, listen: false);
              quizProvider.resetQuiz();
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close quiz screen
            },
            child: Text(
              AppConstants.strings.quit,
              style: const TextStyle(color: AppColors.mordorRed),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            return Text(
              'Question ${quizProvider.currentQuestionIndex + 1}/${quizProvider.currentQuestions.length}',
              style: GoogleFonts.cinzel(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        backgroundColor: AppColors.primaryBrown,
        foregroundColor: AppColors.goldYellow,
        actions: [
          IconButton(
            onPressed: _quitQuiz,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          final question = quizProvider.currentQuestion;
          
          if (question == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              // Progress bar
              Container(
                height: 8,
                margin: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  value: quizProvider.getProgress(),
                  backgroundColor: AppColors.lightBrown,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.goldYellow,
                  ),
                ),
              ),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question card
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppConstants.strings.question,
                                style: GoogleFonts.cinzel(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBrown,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                question.text,
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkText,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Answer options
                      Expanded(
                        child: ListView.builder(
                          itemCount: question.options.length,
                          itemBuilder: (context, index) {
                            final isSelected = _selectedAnswerIndex == index;
                            final isCorrect = question.correctAnswerIndex == index;
                            
                            Color backgroundColor = Colors.white;
                            Color borderColor = AppColors.lightBrown;
                            Color textColor = AppColors.darkText;
                            
                            if (_showExplanation) {
                              if (isCorrect) {
                                backgroundColor = AppColors.correct.withOpacity(0.1);
                                borderColor = AppColors.correct;
                                textColor = AppColors.correct;
                              } else if (isSelected && !isCorrect) {
                                backgroundColor = AppColors.incorrect.withOpacity(0.1);
                                borderColor = AppColors.incorrect;
                                textColor = AppColors.incorrect;
                              }
                            } else if (isSelected) {
                              backgroundColor = AppColors.primaryBrown.withOpacity(0.1);
                              borderColor = AppColors.primaryBrown;
                            }
                            
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: Material(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(12),
                                child: InkWell(
                                  onTap: _showExplanation ? null : () => _selectAnswer(index),
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: borderColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: borderColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              String.fromCharCode(65 + index), // A, B, C, D
                                              style: GoogleFonts.cinzel(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text(
                                            question.options[index],
                                            style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: textColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        if (_showExplanation && isCorrect)
                                          const Icon(
                                            Icons.check_circle,
                                            color: AppColors.correct,
                                          ),
                                        if (_showExplanation && isSelected && !isCorrect)
                                          const Icon(
                                            Icons.cancel,
                                            color: AppColors.incorrect,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      
                      // Explanation
                      if (_showExplanation) ...[
                        Card(
                          elevation: 4,
                          color: AppColors.info.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.lightbulb,
                                  color: AppColors.info,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    question.explanation,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: AppColors.darkText,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      
                      // Next button
                      if (_selectedAnswerIndex != null)
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _nextQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBrown,
                              foregroundColor: AppColors.goldYellow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              quizProvider.isLastQuestion ? AppConstants.strings.finishQuiz : AppConstants.strings.nextQuestion,
                              style: GoogleFonts.cinzel(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
