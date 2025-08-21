/*
 * CHARACTER DETAIL HELPERS - Karakter Detay Helper Sınıfları
 * 
 * MVVM mimarisinde helper sınıfları:
 * - UI bileşenlerini organize eder
 * - Code reusability sağlar
 * - Clean code prensiplerini destekler
 * - Test edilebilir widget factory'ler sunar
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_widgets.dart';
import '../models/character.dart';
import '../services/audio_service.dart';

/// Extension for easier spacing - UI utility
extension SpacingExtension on double {
  Widget get verticalSpace => SizedBox(height: this);
  Widget get horizontalSpace => SizedBox(width: this);
}

/// Character Detail ekranı için UI Helper sınıfı
/// MVVM pattern'de View katmanının helper'ı olarak çalışır
/// Static metodlar ile widget factory pattern uygulanmıştır
class CharacterDetailHelpers {
  
  // Private constructor - static factory pattern için instantiation engellenir
  CharacterDetailHelpers._();

  /// Error Screen Builder - Karakter bulunamadığında gösterilecek hata ekranı
  /// @return Scaffold widget with error message
  static Widget buildErrorScreen() => Scaffold(
    appBar: AppBar(title: Text(AppConstants.strings.characterNotFound)),
    body: Center(child: Text(AppConstants.strings.characterNotFoundMessage)),
  );

  /// Character Header Builder - SliverAppBar ile karakter başlık kısmı
  /// Karakter resmi, isim ve kategori rengini içerir
  /// @param character Gösterilecek karakter verisi
  /// @param categoryColor Kategori bazlı tema rengi
  /// @return SliverAppBar widget with character image and name
  static Widget buildHeader(Character character, Color categoryColor) => SliverAppBar(
    // Genişletilmiş yükseklik - AppConstants'tan alınan responsive değer
    expandedHeight: AppConstants.sizes.characterHeaderHeight,
    pinned: true, // Scroll sırasında sabit kalması için
    backgroundColor: categoryColor, // Kategori rengini uygula
    flexibleSpace: FlexibleSpaceBar(
      // Karakter ismi - Google Fonts ile özel font
      title: Text(
        character.name,
        style: GoogleFonts.cinzel(
          fontWeight: FontWeight.bold,
          // Metin okunabilirliği için gölge efekti
          shadows: [
            const Shadow(
              color: Colors.black54,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
      ),
      // Arka plan resmi ve gradient overlay
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(character.imagePath), // Karakter resmi
            fit: BoxFit.cover, // Tam kaplamak için
          ),
        ),
        // Gradient overlay - üstten alta kategori rengi geçişi
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                categoryColor.withOpacity(0.3), // Üst kısım daha şeffaf
                categoryColor.withOpacity(0.8), // Alt kısım daha opak
              ],
            ),
          ),
        ),
      ),
    ),
  );

  /// Basic Info Card Builder - Temel karakter bilgileri kartı
  /// İsim, lakab, ırk, boy, kilo bilgilerini gösterir
  /// @param character Bilgileri gösterilecek karakter
  /// @return CustomCard widget with character basic information
  static Widget buildBasicInfoCard(Character character) => CustomCard.standard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kart başlığı - "Temel Bilgiler"
        CustomText.heading(
          text: AppConstants.strings.basicInfo,
          customColor: AppColors.darkText,
        ),
        // Başlık altı boşluk
        AppConstants.spacing.medium.verticalSpace,
        // Her bilgi için info row oluştur
        CharacterInfoHelpers.buildInfoRow(AppConstants.strings.name, character.name),
        CharacterInfoHelpers.buildInfoRow(AppConstants.strings.nickname, character.nickname),
        CharacterInfoHelpers.buildInfoRow(AppConstants.strings.race, character.race),
        CharacterInfoHelpers.buildInfoRow(AppConstants.strings.height, character.height),
        CharacterInfoHelpers.buildInfoRow(AppConstants.strings.weight, character.weight),
      ],
    ),
  );

  /// Weapons Card Builder - Silahlar ve ekipmanlar kartı
  /// Karakter silahlarını liste halinde gösterir
  /// @param character Silahları gösterilecek karakter
  /// @param categoryColor İkon rengi için kategori rengi
  /// @return CustomCard widget with weapons list
  static Widget buildWeaponsCard(Character character, Color categoryColor) => CustomCard.standard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kart başlığı - "Silahlar ve Ekipmanlar"
        CustomText.heading(
          text: AppConstants.strings.weaponsAndEquipment,
          customColor: AppColors.darkText,
        ),
        AppConstants.spacing.small.verticalSpace,
        // Her silah için list item oluştur
        ...character.weapons.map((weapon) => 
          CharacterInfoHelpers.buildListItem(weapon, Icons.double_arrow, categoryColor)
        ),
      ],
    ),
  );

  /// Abilities Card Builder - Özel yetenekler kartı
  /// Karakter yeteneklerini liste halinde gösterir
  /// @param character Yetenekleri gösterilecek karakter
  /// @param categoryColor İkon rengi için kategori rengi
  /// @return CustomCard widget with abilities list
  static Widget buildAbilitiesCard(Character character, Color categoryColor) => CustomCard.standard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kart başlığı - "Özel Yetenekler"
        CustomText.heading(
          text: AppConstants.strings.specialAbilities,
          customColor: AppColors.darkText,
        ),
        AppConstants.spacing.small.verticalSpace,
        // Her yetenek için list item oluştur (yıldız ikonu ile)
        ...character.abilities.map((ability) => 
          CharacterInfoHelpers.buildListItem(ability, Icons.star, categoryColor)
        ),
      ],
    ),
  );

  /// Story Card Builder - Karakter hikayesi kartı
  /// Karakterin hikayesini metin halinde gösterir
  /// @param character Hikayesi gösterilecek karakter
  /// @return CustomCard widget with character story
  static Widget buildStoryCard(Character character) => CustomCard.standard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kart başlığı - "Hikaye"
        CustomText.heading(
          text: AppConstants.strings.story,
          customColor: AppColors.darkText,
        ),
        AppConstants.spacing.small.verticalSpace,
        // Karakter hikayesi metni
        CustomText.body(
          text: character.story,
          customColor: AppColors.darkText,
        ),
      ],
    ),
  );

  /// Quiz Button Builder - Quiz başlatma butonu
  /// Karakterin kategorisine göre renklendirilmiş buton
  /// @param character Quiz kategorisi için karakter
  /// @param categoryColor Buton rengi için kategori rengi
  /// @return CustomButton widget for starting quiz
  static Widget buildQuizButton(Character character, Color categoryColor) => CustomButton(
    // Buton metni - kategori adı + "Bilgi Yarışması Başlat"
    text: '${character.category.displayName} ${AppConstants.strings.startQuiz}',
    onPressed: () {
      // TODO: ViewModel'de quiz navigation'ı implement edilecek
      // Bu noktada quiz ekranına yönlendirme yapılacak
    },
    intent: ButtonIntent.primary, // Ana buton stili
    customBackgroundColor: categoryColor, // Kategori rengini uygula
    customTextColor: Colors.white, // Beyaz metin rengi
  );

  /// Audio Button Builder - Karakter sesi çalma butonu
  /// FloatingActionButton olarak sağ alt köşede konumlanır
  /// @param character Sesi çalınacak karakter
  /// @param categoryColor Buton rengi için kategori rengi
  /// @return FloatingActionButton for playing character sound
  static Widget buildAudioButton(Character character, Color categoryColor) => FloatingActionButton(
    // Karakter sesini çalma işlemi
    onPressed: () => AudioService().playCharacterSound(character.name),
    backgroundColor: categoryColor, // Kategori rengini uygula
    child: Icon(
      Icons.play_arrow, // Play ikonu
      color: Colors.white, // Beyaz ikon rengi
      size: AppConstants.sizes.iconLarge, // Büyük ikon boyutu
    ),
  );
}

/// Character Info Helper sınıfı - Bilgi gösterimi için utility metodları  
/// UI bileşenlerinde tekrar kullanılabilir info widget'ları sağlar
/// Stateless ve pure function yaklaşımı ile clean code prensiplerine uyar
class CharacterInfoHelpers {
  
  // Private constructor - utility class olduğu için instantiation engellenir
  CharacterInfoHelpers._();

  /// Info Row Builder - Label ve değer çifti gösteren satır bileşeni
  /// Karakter detay bilgilerini düzenli şekilde göstermek için kullanılır
  /// @param label Gösterilecek etiket (örn: "İsim", "Yaş")
  /// @param value Gösterilecek değer (örn: "Aragorn", "87")
  /// @return Padding widget containing label-value row
  static Widget buildInfoRow(String label, String value) => Padding(
    // Her info row arasında dikey boşluk
    padding: EdgeInsets.only(bottom: AppConstants.spacing.small),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Üstten hizala
      children: [
        // Label kısmı - kalın yazı ile etiket
        Expanded(
          flex: 2, // Toplam genişliğin 2/5'i
          child: Text(
            '$label:', // İki nokta ekle
            style: AppConstants.bodyTextStyle.copyWith(
              color: AppColors.darkText,
              fontWeight: FontWeight.w600, // Kalın yazı
            ),
          ),
        ),
        // Value kısmı - normal yazı ile değer
        Expanded(
          flex: 3, // Toplam genişliğin 3/5'i
          child: CustomText.body(
            text: value,
            customColor: AppColors.darkText,
          ),
        ),
      ],
    ),
  );

  /// List Item Builder - İkonlu liste elemanı oluşturucu
  /// Silah, yetenek gibi listelerde kullanılır
  /// @param text Gösterilecek metin
  /// @param icon Gösterilecek ikon
  /// @param color İkon ve accent rengi
  /// @return Padding widget containing icon and text
  static Widget buildListItem(String text, IconData icon, Color color) => Padding(
    // Her liste elemanı arasında dikey boşluk
    padding: EdgeInsets.symmetric(vertical: AppConstants.spacing.extraSmall),
    child: Row(
      children: [
        // İkon kısmı - kategori renginde
        Icon(
          icon,
          size: AppConstants.sizes.characterIconSize, // Karakter ikon boyutu
          color: color, // Kategori rengini uygula
        ),
        // İkon ile metin arası yatay boşluk
        AppConstants.spacing.small.horizontalSpace,
        // Metin kısmı - kalan alanı kapla
        CustomText.body(
          text: text,
          customColor: AppColors.darkText,
        ),
      ],
    ),
  );

}
