// Main Menu Screen - Clean version with centralized strings
import 'package:flutter/material.dart';
import '../data/character_data.dart';
import '../models/character.dart';
import '../utils/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/book_page_widget.dart';
import '../widgets/character_avatar_widget.dart';
import '../utils/app_shadows.dart';
import '../services/audio_service.dart';
import 'character_detail_screen.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  bool _isMusicEnabled = true;

  final List<CharacterCategory> _categories = [
    CharacterCategory.elves,
    CharacterCategory.hobbits,
    CharacterCategory.dwarves,
    CharacterCategory.men,
    CharacterCategory.orcsAndDarkForces,
    CharacterCategory.wizardsAndMaiar,
  ];

  @override
  void initState() {
    super.initState();
    // İlk açılışta elfler müziğini başlat (index 0 = elves)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AudioService().playCategoryMusic('elves');
    });
  }

  @override
  void dispose() {
    // PageController'ı temizle (memory leak önlemi)
    _pageController.dispose();
    super.dispose();
  }

  // Sayfa değiştiğinde çağrılan fonksiyon
  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index; // Sayfa göstergesini güncelle
    });
    
    // Kategori değiştiğinde o kategorinin müziğini çal
    if (index < _categories.length) {
      final category = _categories[index];
      final categoryName = category.toString().split('.').last;
      AudioService().playCategoryMusic(categoryName);
    }
  }

  // Quiz başlatma fonksiyonu
  void _startQuiz(CharacterCategory? category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(category: category),
      ),
    );
  }

  // Karakter detayını göster
  void _showCharacterDetail(String characterId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailScreen(characterId: characterId),
      ),
    );
  }

  // Profile sayfasina git
  void _showProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  // Ayarlar dialog'unu goster
  void _showSettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.darkBrown,
          title: Text(
            AppConstants.strings.settings,
            style: TextStyle(
              color: AppColors.goldYellow,
              fontFamily: 'Cinzel',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppConstants.strings.music,
                        style: TextStyle(
                          color: AppColors.lightBrown,
                          fontSize: 16,
                        ),
                      ),
                      Switch(
                        value: _isMusicEnabled,
                        onChanged: (value) {
                          setState(() {
                            _isMusicEnabled = value;
                          });
                          this.setState(() {});
                        },
                        activeColor: AppColors.goldYellow,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                AppConstants.strings.close,
                style: TextStyle(
                  color: AppColors.goldYellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Karakterler bottom sheet'ini goster
  void _showCharactersBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: AppColors.darkBrown,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: AppShadows.modalShadow,
        ),
        child: Column(
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.lightBrown,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            // Title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                AppConstants.strings.characters,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.goldYellow,
                  fontFamily: 'Cinzel',
                ),
              ),
            ),
            
            // Characters Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: CharacterData.getAllCharacters().length,
                itemBuilder: (context, index) {
                  final character = CharacterData.getAllCharacters()[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _showCharacterDetail(character.id);
                    },
                    child: CharacterAvatarWidget(
                      characterId: character.id,
                      onTap: () => _showCharacterDetail(character.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Ana widget yapisi - arka plan resmi ve gradient ile
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Arka plan resmi (Anamenu.jpg)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Anamenu.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            // Gradient overlay - gorsel netligini artirmak icin
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              children: [
                // Ust bar - profil ve ayarlar butonlari
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profil butonu
                      IconButton(
                        onPressed: _showProfile,
                        icon: const Icon(Icons.person),
                        color: AppColors.goldYellow,
                        iconSize: 28,
                      ),
                      
                      // Ana baslik - AppConstants'dan cekiliyor
                      Expanded(
                        child: Text(
                          AppConstants.strings.appMainTitle,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.goldYellow,
                            fontFamily: 'Cinzel',
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      
                      // Ayarlar butonu
                      IconButton(
                        onPressed: _showSettings,
                        icon: const Icon(Icons.settings),
                        color: AppColors.goldYellow,
                        iconSize: 28,
                      ),
                    ],
                  ),
                ),

                // Ana icerik alani
                Expanded(
                  child: Column(
                    children: [
                      // Kategori sayfalarini gosteren PageView
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: BookPageWidget(
                                category: category,
                                onStartQuiz: () => _startQuiz(category),
                                onCharacterTap: _showCharacterDetail,
                              ),
                            );
                          },
                        ),
                      ),

                      // Sayfa gostergesi - hangi kategoride oldugunu goster
                      Container(
                        height: 20,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _categories.length,
                            (index) => Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPageIndex == index
                                    ? AppColors.primaryBrown
                                    : AppColors.primaryBrown.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Karakterler bottom butonu - bottom sheet acar
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ElevatedButton.icon(
                          onPressed: () => _showCharactersBottomSheet(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBrown,
                            foregroundColor: AppColors.goldYellow,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.people),
                          label: Text(
                            AppConstants.strings.characters,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cinzel',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}