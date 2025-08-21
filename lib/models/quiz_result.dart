import 'question.dart';
import 'character.dart';

class QuizResult {
  final String id;
  final CharacterCategory category;
  final List<Question> questions;
  final List<int> userAnswers;
  final int score;
  final int totalQuestions;
  final DateTime completedAt;
  final int timeSpentInSeconds;
  
  QuizResult({
    required this.id,
    required this.category,
    required this.questions,
    required this.userAnswers,
    required this.score,
    required this.totalQuestions,
    required this.completedAt,
    required this.timeSpentInSeconds,
  });

  double get percentage => (score / totalQuestions) * 100;

  String get grade {
    final percentage = this.percentage;
    if (percentage >= 90) return 'Excellent';
    if (percentage >= 80) return 'Very Good';
    if (percentage >= 70) return 'Good';
    if (percentage >= 60) return 'Fair';
    return 'Poor';
  }

  factory QuizResult.fromJson(Map<String, dynamic> json) {
    return QuizResult(
      id: json['id'] ?? '',
      category: CharacterCategory.values.firstWhere(
        (cat) => cat.toString() == 'CharacterCategory.${json['category']}',
        orElse: () => CharacterCategory.men,
      ),
      questions: (json['questions'] as List<dynamic>?)
              ?.map((q) => Question.fromJson(q))
              .toList() ??
          [],
      userAnswers: List<int>.from(json['userAnswers'] ?? []),
      score: json['score'] ?? 0,
      totalQuestions: json['totalQuestions'] ?? 0,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : DateTime.now(),
      timeSpentInSeconds: json['timeSpentInSeconds'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category.toString().split('.').last,
      'questions': questions.map((q) => q.toJson()).toList(),
      'userAnswers': userAnswers,
      'score': score,
      'totalQuestions': totalQuestions,
      'completedAt': completedAt.toIso8601String(),
      'timeSpentInSeconds': timeSpentInSeconds,
    };
  }
}
