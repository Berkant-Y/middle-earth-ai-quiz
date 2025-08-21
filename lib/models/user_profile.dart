class UserProfile {
  final String id;
  final String username;
  final String selectedAvatar;
  final int totalQuizzes;
  final int highestScore;
  final Map<String, int> categoryScores;
  final DateTime lastPlayedDate;
  final int totalCorrectAnswers;
  final int totalQuestions;
  final List<String> achievements;

  UserProfile({
    required this.id,
    required this.username,
    required this.selectedAvatar,
    this.totalQuizzes = 0,
    this.highestScore = 0,
    this.categoryScores = const {},
    DateTime? lastPlayedDate,
    this.totalCorrectAnswers = 0,
    this.totalQuestions = 0,
    this.achievements = const [],
  }) : lastPlayedDate = lastPlayedDate ?? DateTime.now();

  double get accuracy {
    if (totalQuestions == 0) return 0.0;
    return (totalCorrectAnswers / totalQuestions) * 100;
  }

  UserProfile copyWith({
    String? id,
    String? username,
    String? selectedAvatar,
    int? totalQuizzes,
    int? highestScore,
    Map<String, int>? categoryScores,
    DateTime? lastPlayedDate,
    int? totalCorrectAnswers,
    int? totalQuestions,
    List<String>? achievements,
  }) {
    return UserProfile(
      id: id ?? this.id,
      username: username ?? this.username,
      selectedAvatar: selectedAvatar ?? this.selectedAvatar,
      totalQuizzes: totalQuizzes ?? this.totalQuizzes,
      highestScore: highestScore ?? this.highestScore,
      categoryScores: categoryScores ?? this.categoryScores,
      lastPlayedDate: lastPlayedDate ?? this.lastPlayedDate,
      totalCorrectAnswers: totalCorrectAnswers ?? this.totalCorrectAnswers,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      achievements: achievements ?? this.achievements,
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      username: json['username'] ?? 'Guest',
      selectedAvatar: json['selectedAvatar'] ?? 'frodo',
      totalQuizzes: json['totalQuizzes'] ?? 0,
      highestScore: json['highestScore'] ?? 0,
      categoryScores: Map<String, int>.from(json['categoryScores'] ?? {}),
      lastPlayedDate: json['lastPlayedDate'] != null
          ? DateTime.parse(json['lastPlayedDate'])
          : DateTime.now(),
      totalCorrectAnswers: json['totalCorrectAnswers'] ?? 0,
      totalQuestions: json['totalQuestions'] ?? 0,
      achievements: List<String>.from(json['achievements'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'selectedAvatar': selectedAvatar,
      'totalQuizzes': totalQuizzes,
      'highestScore': highestScore,
      'categoryScores': categoryScores,
      'lastPlayedDate': lastPlayedDate.toIso8601String(),
      'totalCorrectAnswers': totalCorrectAnswers,
      'totalQuestions': totalQuestions,
      'achievements': achievements,
    };
  }
}
