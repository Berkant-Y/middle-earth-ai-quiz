/*
 * CHARACTER DETAIL SCREEN - Karakter Detay Ekranı
 * 
 * MVVM Pattern - View Layer
 * Helper sınıfları ile organize edilmiş clean code yapısı
 */

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/app_colors.dart';
import '../data/character_data.dart';
import '../helpers/character_detail_helpers.dart';

/// Karakter detay ekranı - MVVM View katmanı
/// Bu ekran seçilen karakterin ayrıntılı bilgilerini gösterir
/// Helper pattern kullanarak kod organize edilmiş ve yeniden kullanılabilir hale getirilmiştir
class CharacterDetailScreen extends StatelessWidget {
  // Private field - karakter ID'sini güvenli şekilde saklar
  final String _characterId;

  /// Constructor - karakterId parametresini alır ve private field'a atar
  const CharacterDetailScreen({
    super.key,
    required String characterId,
  }) : _characterId = characterId;

  /// Ana build methodu - UI'ı oluşturur
  @override
  Widget build(BuildContext context) {
    // 1. Karakter verisini ID ile database'den çek
    final character = CharacterData.getCharacterById(_characterId);
    
    // 2. Karakter bulunamadı durumu - error screen göster
    if (character == null) {
      return CharacterDetailHelpers.buildErrorScreen();
    }

    // 3. Kategori bazlı dinamik renk belirleme
    // Karakter kategorisine göre tema rengi seç
    final categoryColor = AppColors.categoryColors[
      character.category.toString().split('.').last
    ] ?? AppColors.primaryBrown;

    // 4. Ana scaffold yapısını oluştur
    return Scaffold(
      // Scrollable içerik için CustomScrollView kullan
      body: CustomScrollView(
        slivers: [
          // Header kısmı - karakter resmi ve isim
          CharacterDetailHelpers.buildHeader(character, categoryColor),
          
          // İçerik kısmı - karakter bilgileri
          SliverToBoxAdapter(
            child: Padding(
              // Responsive padding - AppConstants'tan alınan değer
              padding: AppConstants.padding.medium,
              child: Column(
                children: [
                  // Temel bilgiler kartı (isim, ırk, boy, kilo)
                  CharacterDetailHelpers.buildBasicInfoCard(character),
                  
                  // Responsive spacing
                  AppConstants.spacing.medium.verticalSpace,
                  
                  // Silahlar kartı - sadece varsa göster
                  if (character.weapons.isNotEmpty) ...[
                    CharacterDetailHelpers.buildWeaponsCard(character, categoryColor),
                    AppConstants.spacing.medium.verticalSpace,
                  ],
                  
                  // Yetenekler kartı - sadece varsa göster
                  if (character.abilities.isNotEmpty) ...[
                    CharacterDetailHelpers.buildAbilitiesCard(character, categoryColor),
                    AppConstants.spacing.medium.verticalSpace,
                  ],
                  
                  // Hikaye kartı - her karakterde mevcut
                  CharacterDetailHelpers.buildStoryCard(character),
                  
                  // Quiz butonu için daha büyük spacing
                  AppConstants.spacing.extraLarge.verticalSpace,
                  
                  // Quiz başlatma butonu - kategori renginde
                  CharacterDetailHelpers.buildQuizButton(character, categoryColor),
                  
                  // Alt boşluk
                  AppConstants.spacing.large.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Karakter sesi çalma butonu - sağ alt köşede floating button
      floatingActionButton: CharacterDetailHelpers.buildAudioButton(character, categoryColor),
    );
  }
}