/*
 * APP STRINGS - Uygulama Metin Sabitleri
 * 
 * Tüm uygulama genelinde kullanılan metin sabitlerini içerir.
 * Hardcoded string'leri önler ve çoklu dil desteği sağlar.
 * Her kelime, cümle ve metin burada tanımlanır.
 */

/// Uygulama metin sabitleri
class AppStrings {
  // Private constructor - static sınıf
  AppStrings._();

  // ============ BUTTON TEXTS ============
  static const ButtonTexts buttons = ButtonTexts._();

  // ============ QUIZ TEXTS ============
  static const QuizTexts quiz = QuizTexts._();

  // ============ PERFORMANCE TEXTS ============
  static const PerformanceTexts performance = PerformanceTexts._();

  // ============ MENU TEXTS ============
  static const MenuTexts menu = MenuTexts._();

  // ============ GENERAL TEXTS ============
  static const GeneralTexts general = GeneralTexts._();

  // ============ CHARACTER TEXTS ============
  static const CharacterTexts character = CharacterTexts._();

  // ============ PROFILE TEXTS ============
  static const ProfileTexts profile = ProfileTexts._();

  // ============ FIELD LABELS ============
  static const FieldLabels fields = FieldLabels._();

  // ============ NUMERIC CONSTANTS ============
  static const NumericConstants numbers = NumericConstants._();

  // ============ AUDIO PATHS ============
  static const AudioPaths audio = AudioPaths._();
}

/// Buton metinleri
class ButtonTexts {
  const ButtonTexts._();

  // Ana butonlar
  String get startText => 'Start';
  String get backText => 'Back';
  String get nextText => 'Next';
  String get previousText => 'Previous';
  String get closeText => 'Close';
  String get cancelText => 'Cancel';
  String get confirmText => 'Confirm';
  String get saveText => 'Save';
  String get retryText => 'Retry';
  String get continueText => 'Continue';
  String get exitText => 'Exit';
  String get submitText => 'Submit';

  // Quiz butonları
  String get startQuizText => 'Start Quiz';
  String get backToMenu => 'Back to Menu';
  String get tryAgain => 'Try Again';
  String get continueQuizText => 'Continue Quiz';
  String get exitQuizText => 'Exit Quiz';
  String get submitAnswerText => 'Submit Answer';
  String get restartQuizText => 'Restart Quiz';

  // Navigasyon butonları
  String get toProfileText => 'Profile';
  String get toSettingsText => 'Settings';
  String get toCharactersText => 'Characters';
  String get selectCategoryText => 'Select Category';
  String get viewDetailsText => 'View Details';
  String get editText => 'Edit';
  String get deleteText => 'Delete';
  String get addText => 'Add';
  String get removeText => 'Remove';
}

/// Quiz metinleri
class QuizTexts {
  const QuizTexts._();

  // Quiz durumları
  String get completeText => 'Quiz Complete!';
  String get inProgressText => 'Quiz in Progress';
  String get loadingText => 'Loading Quiz...';
  String get failedText => 'Quiz Failed to Load';
  String get startingText => 'Starting Quiz...';

  // Quiz bilgileri
  String get questionText => 'Question';
  String get ofText => 'of';
  String get scoreText => 'Score';
  String get timeText => 'Time';
  String get time => 'Time';
  String get categoryText => 'Category';
  String get category => 'Category';
  String get totalQuestionsText => 'Total Questions';
  String get correctAnswersText => 'Correct Answers';
  String get wrongAnswersText => 'Wrong Answers';
  String get accuracyText => 'Accuracy';
  String get speedText => 'Speed';
  String get complete => 'Quiz Complete!';

  // Quiz methodları
  String outOf(int score, int total) => '$score / $total';
  String percentageFormat(double percentage) => '${percentage.toStringAsFixed(1)}%';
  String timeFormat(double minutes) => '${minutes.toStringAsFixed(1)} min';

  // Quiz mesajları
  String get timeUpText => 'Time\'s Up!';
  String get wellDoneText => 'Well Done!';
  String get keepTryingText => 'Keep Trying!';
  String get almostThereText => 'Almost There!';
  String get greatJobText => 'Great Job!';

  String questionCounterFormat(int current, int total) => '$current $ofText $total';
  String secondsFormat(int seconds) => '${seconds}s';
  String minutesFormat(int minutes) => '${minutes}m';
}

/// Performans metinleri
class PerformanceTexts {
  const PerformanceTexts._();

  // Performans seviyeleri
  String get excellent => 'Excellent!';
  String get veryGood => 'Very Good!';
  String get goodJob => 'Good Job!';
  String get notBad => 'Not Bad!';
  String get keepTrying => 'Keep Trying!';
  String get studyMore => 'Study More!';
  String get practiceMore => 'Practice More!';

  // Performans açıklamaları
  String get trueScholar => 'You are a true Middle-earth scholar!';
  String get knowsWell => 'You know your LOTR very well!';
  String get goodKnowledge => 'Good knowledge of Middle-earth!';
  String get rereadBooks => 'You might want to reread the books.';
  String get brushUp => 'Time to brush up on your LOTR knowledge.';
  String get watchMovies => 'Consider watching the movies again!';

  // Seviye rozetleri
  String get masterLevel => 'Master Level';
  String get expertLevel => 'Expert Level';
  String get advancedLevel => 'Advanced Level';
  String get intermediateLevel => 'Intermediate Level';
  String get beginnerLevel => 'Beginner Level';
  String get noviceLevel => 'Novice Level';

  // Grade labels
  String get gradeAText => 'A';
  String get gradeBText => 'B';
  String get gradeCText => 'C';
  String get gradeDText => 'D';
  String get gradeFText => 'F';
}

/// Menü metinleri
class MenuTexts {
  const MenuTexts._();

  // Ana menü
  String get mainMenuText => 'Main Menu';
  String get chooseCategoryText => 'Choose a Category';
  String get selectCharacterText => 'Select Character';
  String get viewProfileText => 'View Profile';
  String get settingsText => 'Settings';
  String get aboutText => 'About';

  // Ayarlar menü
  String get soundSettingsText => 'Sound Settings';
  String get backgroundMusicText => 'Background Music';
  String get characterSoundsText => 'Character Sounds';
  String get soundEffectsText => 'Sound Effects';
  String get volumeText => 'Volume';
  String get muteAllText => 'Mute All';
  String get enableSoundText => 'Enable Sound';
  String get disableSoundText => 'Disable Sound';

  // Kategori isimleri
  String get fellowshipText => 'Fellowship';
  String get twoTowersText => 'Two Towers';
  String get returnKingText => 'Return of the King';
  String get hobbitsText => 'Hobbits';
  String get wizardsText => 'Wizards';
  String get ringsText => 'Rings';

  // Profil menüsü
  String get editProfileText => 'Edit Profile';
  String get statisticsText => 'Statistics';
  String get achievementsText => 'Achievements';
  String get resetProgressText => 'Reset Progress';
  String get changeAvatarText => 'Change Avatar';
  String get changeNameText => 'Change Name';
}

/// Genel metinler
class GeneralTexts {
  const GeneralTexts._();

  // Uygulama bilgileri
  String get appTitle => 'Middle-earth Quiz';
  String get appSubtitle => 'Test your knowledge of Middle-earth';
  String get appDescription => 'A comprehensive quiz about the world of Lord of the Rings';

  // Splash screen metinleri
  String get splashMainTitle => 'YÜZÜKLERIN EFENDİSİ';
  String get splashSubTitle => 'BİLGİ YARIŞMASI';

  // Durum mesajları
  String get loadingText => 'Loading...';
  String get errorText => 'Error';
  String get successText => 'Success';
  String get warningText => 'Warning';
  String get infoText => 'Information';
  String get noDataText => 'No Data Available';
  String get tryAgainText => 'Try Again';

  // Onay mesajları
  String get areYouSureText => 'Are you sure?';
  String get confirmActionText => 'Confirm Action';
  String get actionCannotBeUndoneText => 'This action cannot be undone.';
  String get dataWillBeLostText => 'All data will be lost.';

  // Form mesajları
  String get requiredText => 'Required';
  String get optionalText => 'Optional';
  String get invalidText => 'Invalid';
  String get tooShortText => 'Too short';
  String get tooLongText => 'Too long';
  String get emptyFieldText => 'Field cannot be empty';

  // Zaman ifadeleri
  String get seconds => 's';
  String get secondsText => 'seconds';
  String get minutesText => 'minutes';
  String get hoursText => 'hours';
  String get daysText => 'days';

  // Genel aksiyonlar
  String get yesText => 'Yes';
  String get noText => 'No';
  String get okText => 'OK';
  String get doneText => 'Done';
}

/// Karakter metinleri
class CharacterTexts {
  const CharacterTexts._();

  // Karakter bilgileri
  String get nameText => 'Name';
  String get descriptionText => 'Description';
  String get categoryText => 'Category';
  String get originText => 'Origin';
  String get raceText => 'Race';
  String get affiliationText => 'Affiliation';
  String get weaponText => 'Weapon';
  String get ageText => 'Age';
  String get heightText => 'Height';
  String get detailsText => 'Details';

  // Karakter durumları
  String get aliveText => 'Alive';
  String get deadText => 'Dead';
  String get unknownText => 'Unknown';
  String get missingText => 'Missing';

  // Karakter türleri
  String get hobbitText => 'Hobbit';
  String get humanText => 'Human';
  String get elfText => 'Elf';
  String get dwarfText => 'Dwarf';
  String get wizardText => 'Wizard';
  String get orcText => 'Orc';
  String get entText => 'Ent';
}

/// Profil metinleri
class ProfileTexts {
  const ProfileTexts._();

  // Profil bilgileri
  String get usernameText => 'Username';
  String get emailText => 'Email';
  String get avatarText => 'Avatar';
  String get joinDateText => 'Join Date';
  String get lastActiveText => 'Last Active';

  // İstatistikler
  String get totalGamesText => 'Total Games';
  String get highestScoreText => 'Highest Score';
  String get averageScoreText => 'Average Score';
  String get totalTimeText => 'Total Time Played';
  String get winRateText => 'Win Rate';
  String get currentStreakText => 'Current Streak';
  String get longestStreakText => 'Longest Streak';

  // Başarımlar
  String get badgesEarnedText => 'Badges Earned';
  String get levelsCompletedText => 'Levels Completed';
  String get perfectScoresText => 'Perfect Scores';
  String get quickAnswersText => 'Quick Answers';
}

/// Alan etiketleri
class FieldLabels {
  const FieldLabels._();

  // Form alanları
  String get firstNameLabel => 'First Name';
  String get lastNameLabel => 'Last Name';
  String get usernameLabel => 'Username';
  String get emailLabel => 'Email Address';
  String get passwordLabel => 'Password';
  String get confirmPasswordLabel => 'Confirm Password';
  String get phoneLabel => 'Phone Number';
  String get addressLabel => 'Address';
  String get cityLabel => 'City';
  String get countryLabel => 'Country';

  // Placeholder'lar
  String get enterNamePlaceholder => 'Enter your name';
  String get enterEmailPlaceholder => 'Enter your email';
  String get enterPasswordPlaceholder => 'Enter your password';
  String get searchPlaceholder => 'Search...';
  String get commentPlaceholder => 'Add a comment...';
}

/// Sayısal sabitler
class NumericConstants {
  const NumericConstants._();

  // Responsive design sabitleri
  double get responsiveBreakpoint => 600.0;
  double get tabletBreakpoint => 768.0;
  double get desktopBreakpoint => 1024.0;

  // Skor sabitleri
  int get maxScore => 100;
  int get minScore => 0;
  int get perfectScore => 100;
  
  // Zaman sabitleri
  int get defaultTimeLimit => 30; // saniye
  int get extendedTimeLimit => 60; // saniye
  int get quickTimeLimit => 15; // saniye
  
  // Seviye sabitleri
  double get excellentThreshold => 90.0;
  double get goodThreshold => 70.0;
  double get averageThreshold => 50.0;
  
  // Sayfa sabitleri
  int get questionsPerPage => 10;
  int get charactersPerPage => 12;
  int get resultsPerPage => 15;
}

/// Ses dosyası yolları
class AudioPaths {
  const AudioPaths._();

  // Ana tema müziği
  String get mainTheme => 'assets/sounds/Lotr_Main.mp3';

  // Kategori müzikleri
  String get elvesTheme => 'assets/sounds/Lothlorien.mp3';
  String get hobbitsTheme => 'assets/sounds/Concering_Hobbits.mp3';
  String get dwarvesTheme => 'assets/sounds/Misty_Mountains.mp3';
  String get menTheme => 'assets/sounds/Minas_Trith.mp3';
  String get orcsTheme => 'assets/sounds/Uruk_Hai.mp3';
  String get wizardsTheme => 'assets/sounds/Khazad_Dum.mp3';

  // Karakter sesleri
  String get aragorn => 'assets/sounds/Aragorn.mp3';
  String get boromir => 'assets/sounds/Boromir.mp3';
  String get elrond => 'assets/sounds/Elrond.mp3';
  String get frodo => 'assets/sounds/Frodo.mp3';
  String get galadriel => 'assets/sounds/Galadriel.mp3';
  String get gandalf => 'assets/sounds/Gandalf.mp3';
  String get gimli => 'assets/sounds/Gimli.mp3';
  String get legolas => 'assets/sounds/Legolas.mp3';
  String get merry => 'assets/sounds/Merry.mp3';
  String get pippin => 'assets/sounds/Merry.mp3'; // Aynı ses dosyası
  String get sam => 'assets/sounds/Sam.mp3';
  String get saruman => 'assets/sounds/Saruman.mp3';
  String get sauron => 'assets/sounds/Sauron.mp3';

  // UI ses efektleri (placeholder - gelecekte txt'den mp3'e çevrilebir)
  String get buttonClick => 'assets/sounds/button_click.txt';
  String get correctAnswer => 'assets/sounds/correct_answer.txt';
  String get wrongAnswer => 'assets/sounds/wrong_answer.txt';

  // Karakter isimlerinden ses dosyası yolu alma fonksiyonu
  String getCharacterAudioPath(String characterName) {
    switch (characterName.toLowerCase()) {
      case 'aragorn':
        return aragorn;
      case 'boromir':
        return boromir;
      case 'elrond':
        return elrond;
      case 'frodo':
      case 'frodo baggins':
        return frodo;
      case 'galadriel':
        return galadriel;
      case 'gandalf':
        return gandalf;
      case 'gimli':
        return gimli;
      case 'legolas':
        return legolas;
      case 'merry':
      case 'merry brandybuck':
        return merry;
      case 'pippin':
      case 'pippin took':
        return pippin; // Merry ile aynı ses
      case 'sam':
      case 'samwise':
      case 'samwise gamgee':
        return sam;
      case 'saruman':
        return saruman;
      case 'sauron':
        return sauron;
      default:
        return mainTheme; // Varsayılan olarak ana tema
    }
  }

  // Kategori müzik yollarını alma fonksiyonu
  String getCategoryMusicPath(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'elves':
      case 'elfler':
        return elvesTheme;
      case 'hobbits':
      case 'hobbitler':
        return hobbitsTheme;
      case 'dwarves':
      case 'cüceler':
        return dwarvesTheme;
      case 'men':
      case 'insanlar':
        return menTheme;
      case 'orcsanddarkforces':
      case 'orklar ve karanlık güçler':
        return orcsTheme;
      case 'wizardsandmaiar':
      case 'büyücüler ve maiar':
        return wizardsTheme;
      default:
        return mainTheme; // Varsayılan olarak ana tema
    }
  }
}
