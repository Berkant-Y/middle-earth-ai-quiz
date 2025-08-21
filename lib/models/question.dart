import 'character.dart';

enum QuestionType { multipleChoice, trueFalse }

class Question {
  final String id;
  final String text;
  final QuestionType type;
  final List<String> options;
  final int correctAnswerIndex;
  final String? correctAnswer; // For true/false questions
  final String explanation;
  final CharacterCategory category;
  final String difficulty;

  Question({
    required this.id,
    required this.text,
    required this.type,
    required this.options,
    required this.correctAnswerIndex,
    this.correctAnswer,
    required this.explanation,
    required this.category,
    required this.difficulty,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
      type: QuestionType.values.firstWhere(
        (questionType) => questionType.toString() == 'QuestionType.${json['type']}',
        orElse: () => QuestionType.multipleChoice,
      ),
      options: List<String>.from(json['options'] ?? []),
      correctAnswerIndex: json['correctAnswerIndex'] ?? 0,
      correctAnswer: json['correctAnswer'],
      explanation: json['explanation'] ?? '',
      category: CharacterCategory.values.firstWhere(
        (categoryType) => categoryType.toString() == 'CharacterCategory.${json['category']}',
        orElse: () => CharacterCategory.men,
      ),
      difficulty: json['difficulty'] ?? 'medium',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'type': type.toString().split('.').last,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
      'correctAnswer': correctAnswer,
      'explanation': explanation,
      'category': category.toString().split('.').last,
      'difficulty': difficulty,
    };
  }

  bool isCorrectAnswer(int selectedIndex) {
    return selectedIndex == correctAnswerIndex;
  }

  bool isCorrectTrueFalse(bool selectedAnswer) {
    if (type != QuestionType.trueFalse) return false;
    return selectedAnswer.toString().toLowerCase() == correctAnswer?.toLowerCase();
  }
}
