import 'package:flutter/foundation.dart';
import '../models/user_profile.dart';
import '../models/quiz_result.dart';

class UserProvider with ChangeNotifier {
  UserProfile _userProfile = UserProfile(
    id: 'default_user',
    username: 'Guest',
    selectedAvatar: 'frodo',
  );

  UserProfile get userProfile => _userProfile;

  void updateUsername(String newUsername) {
    _userProfile = _userProfile.copyWith(username: newUsername);
    notifyListeners();
  }

  void updateAvatar(String newAvatar) {
    _userProfile = _userProfile.copyWith(selectedAvatar: newAvatar);
    notifyListeners();
  }

  void updateQuizResults(QuizResult result) {
    final newTotalQuizzes = _userProfile.totalQuizzes + 1;
    final newHighestScore = result.score > _userProfile.highestScore 
        ? result.score 
        : _userProfile.highestScore;
    
    final newTotalCorrect = _userProfile.totalCorrectAnswers + result.score;
    final newTotalQuestions = _userProfile.totalQuestions + result.totalQuestions;
    
    final updatedCategoryScores = Map<String, int>.from(_userProfile.categoryScores);
    final categoryKey = result.category.toString().split('.').last;
    final currentCategoryScore = updatedCategoryScores[categoryKey] ?? 0;
    if (result.score > currentCategoryScore) {
      updatedCategoryScores[categoryKey] = result.score;
    }

    _userProfile = _userProfile.copyWith(
      totalQuizzes: newTotalQuizzes,
      highestScore: newHighestScore,
      categoryScores: updatedCategoryScores,
      lastPlayedDate: DateTime.now(),
      totalCorrectAnswers: newTotalCorrect,
      totalQuestions: newTotalQuestions,
    );

    notifyListeners();
  }

  void addAchievement(String achievement) {
    if (!_userProfile.achievements.contains(achievement)) {
      final newAchievements = List<String>.from(_userProfile.achievements)
        ..add(achievement);
      _userProfile = _userProfile.copyWith(achievements: newAchievements);
      notifyListeners();
    }
  }

  void resetProfile() {
    _userProfile = UserProfile(
      id: 'default_user',
      username: 'Guest',
      selectedAvatar: 'frodo',
    );
    notifyListeners();
  }
}
