import 'package:flutter/foundation.dart';
import '../models/question.dart';
import '../models/quiz_result.dart';
import '../models/character.dart';
import '../data/question_data.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _currentQuestions = [];
  int _currentQuestionIndex = 0;
  List<int> _userAnswers = [];
  bool _isQuizActive = false;
  DateTime? _quizStartTime;
  CharacterCategory? _currentCategory;
  QuizResult? _lastResult;

  List<Question> get currentQuestions => _currentQuestions;
  int get currentQuestionIndex => _currentQuestionIndex;
  List<int> get userAnswers => _userAnswers;
  bool get isQuizActive => _isQuizActive;
  Question? get currentQuestion => 
      _currentQuestions.isNotEmpty && _currentQuestionIndex < _currentQuestions.length
          ? _currentQuestions[_currentQuestionIndex]
          : null;
  
  bool get isLastQuestion => _currentQuestionIndex == _currentQuestions.length - 1;
  int get questionsRemaining => _currentQuestions.length - _currentQuestionIndex - 1;

  void startQuiz(CharacterCategory? category) {
    _currentCategory = category;
    
    if (category != null) {
      _currentQuestions = QuestionData.getQuestionsByCategory(category);
    } else {
      _currentQuestions = QuestionData.getRandomQuestions();
    }
    
    _currentQuestionIndex = 0;
    _userAnswers = [];
    _isQuizActive = true;
    _quizStartTime = DateTime.now();
    notifyListeners();
  }

  void answerQuestion(int answerIndex) {
    if (!_isQuizActive || _currentQuestionIndex >= _currentQuestions.length) {
      return;
    }

    _userAnswers.add(answerIndex);
    
    if (_currentQuestionIndex < _currentQuestions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
    // Son soruda quiz'i otomatik bitirmiyoruz, kullanıcı "Quiz'i Bitir" butonuna basmalı
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _currentQuestions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  QuizResult? finishQuiz() {
    if (!_isQuizActive) return _lastResult;
    
    int score = 0;
    for (int i = 0; i < _currentQuestions.length && i < _userAnswers.length; i++) {
      if (_currentQuestions[i].isCorrectAnswer(_userAnswers[i])) {
        score++;
      }
    }

    final timeSpent = _quizStartTime != null 
        ? DateTime.now().difference(_quizStartTime!).inSeconds 
        : 0;

    final result = QuizResult(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      category: _currentCategory ?? CharacterCategory.men,
      questions: List.from(_currentQuestions),
      userAnswers: List.from(_userAnswers),
      score: score,
      totalQuestions: _currentQuestions.length,
      completedAt: DateTime.now(),
      timeSpentInSeconds: timeSpent,
    );

    _lastResult = result;
    _isQuizActive = false;
    notifyListeners();
    return result;
  }

  void answerLastQuestion(int answerIndex) {
    if (!_isQuizActive || _currentQuestionIndex >= _currentQuestions.length) {
      return;
    }
    _userAnswers.add(answerIndex);
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestions = [];
    _currentQuestionIndex = 0;
    _userAnswers = [];
    _isQuizActive = false;
    _quizStartTime = null;
    _currentCategory = null;
    _lastResult = null;
    notifyListeners();
  }

  double getProgress() {
    if (_currentQuestions.isEmpty) return 0.0;
    return (_currentQuestionIndex + 1) / _currentQuestions.length;
  }
}
