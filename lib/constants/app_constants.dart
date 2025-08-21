/*
 * APP CONSTANTS - Uygulama Sabitleri
 * 
 * Tüm uygulama genelinde kullanılan sabit değerleri içerir.
 * Hiçbir hardcoded değer kullanılmaz, her şey burada tanımlanır.
 * Boyut, renk, stil, animasyon - her parametre centralized.
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

/// Uygulama sabitleri - tüm değerler centralized
class AppConstants {
  // Private constructor - static sınıf
  AppConstants._();

  // ============ SPACING VALUES ============
  static const SpacingValues spacing = SpacingValues._();

  // ============ SIZE VALUES ============
  static const SizeValues sizes = SizeValues._();

  // ============ PADDING VALUES ============
  static const PaddingValues padding = PaddingValues._();

  // ============ MARGIN VALUES ============
  static const MarginValues margin = MarginValues._();

  // ============ BORDER VALUES ============
  static const BorderValues border = BorderValues._();

  // ============ ANIMATION VALUES ============
  static const AnimationValues animation = AnimationValues._();

  // ============ TEXT STYLES ============
  static const TextStyleValues textStyles = TextStyleValues._();

  // ============ ELEVATION VALUES ============
  static const ElevationValues elevation = ElevationValues._();

  // ============ OPACITY VALUES ============
  static const OpacityValues opacity = OpacityValues._();

  // ============ STRING CONSTANTS ============
  static const AppStrings strings = AppStrings._();

  // ============ LEGACY CONSTANTS (for backward compatibility) ============
  static double get spacingXS => spacing.extraSmall;
  static double get spacingS => spacing.small;
  static double get spacingM => spacing.medium;
  static double get spacingL => spacing.large;
  static double get spacingXL => spacing.extraLarge;
  static double get spacingXXL => spacing.extraExtraLarge;

  static EdgeInsets get paddingXS => padding.extraSmall;
  static EdgeInsets get paddingS => padding.small;
  static EdgeInsets get paddingM => padding.medium;
  static EdgeInsets get paddingL => padding.large;
  static EdgeInsets get paddingXL => padding.extraLarge;

  static EdgeInsets get paddingHorizontalS => padding.horizontalSmall;
  static EdgeInsets get paddingHorizontalM => padding.horizontalMedium;
  static EdgeInsets get paddingHorizontalL => padding.horizontalLarge;

  static EdgeInsets get paddingVerticalS => padding.verticalSmall;
  static EdgeInsets get paddingVerticalM => padding.verticalMedium;
  static EdgeInsets get paddingVerticalL => padding.verticalLarge;

  static BorderRadius get borderRadiusS => border.radiusSmallBR;
  static BorderRadius get borderRadiusM => border.radiusMediumBR;
  static BorderRadius get borderRadiusL => border.radiusLargeBR;
  static BorderRadius get borderRadiusXL => border.radiusExtraLargeBR;

  static double get elevationS => elevation.small;
  static double get elevationM => elevation.medium;
  static double get elevationL => elevation.large;
  static double get elevationXL => elevation.extraLarge;

  static double get iconSizeS => sizes.iconSmall;
  static double get iconSizeM => sizes.iconMedium;
  static double get iconSizeL => sizes.iconLarge;
  static double get iconSizeXL => sizes.iconExtraLarge;

  static double get buttonHeightS => sizes.buttonSmall;
  static double get buttonHeightM => sizes.buttonMedium;
  static double get buttonHeightL => sizes.buttonLarge;

  static TextStyle get headingTextStyle => textStyles.heading;
  static TextStyle get titleTextStyle => textStyles.title;
  static TextStyle get bodyTextStyle => textStyles.body;
  static TextStyle get captionTextStyle => textStyles.caption;
  static TextStyle get buttonTextStyle => textStyles.button;
  static TextStyle get scoreTextStyle => textStyles.score;

  static Duration get animationFast => animation.fast;
  static Duration get animationNormal => animation.normal;
  static Duration get animationSlow => animation.slow;

  static LinearGradient get backgroundGradient => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.parchment, AppColors.lightParchment],
  );

  static LinearGradient scoreGradient(Color color) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [color, color.withOpacity(opacity.strong)],
  );
}

/// Spacing değerleri
class SpacingValues {
  const SpacingValues._();

  // Temel spacing değerleri
  double get extraSmall => 4.0;
  double get small => 8.0;
  double get medium => 16.0;
  double get large => 24.0;
  double get extraLarge => 32.0;
  double get extraExtraLarge => 40.0;
  double get huge => 48.0;
  double get massive => 64.0;

  // Özel spacing değerleri
  double get micro => 2.0;
  double get tiny => 6.0;
  double get compact => 12.0;
  double get comfortable => 20.0;
  double get spacious => 28.0;
  double get generous => 36.0;
}

/// Boyut değerleri
class SizeValues {
  const SizeValues._();

  // Icon boyutları
  double get iconMicro => 12.0;
  double get iconSmall => 16.0;
  double get iconMedium => 24.0;
  double get iconLarge => 32.0;
  double get iconExtraLarge => 48.0;
  double get iconHuge => 64.0;
  double get iconMassive => 96.0;

  // Button boyutları
  double get buttonSmall => 36.0;
  double get buttonMedium => 48.0;
  double get buttonLarge => 56.0;
  double get buttonExtraLarge => 64.0;

  // Container boyutları
  double get containerSmall => 100.0;
  double get containerMedium => 200.0;
  double get containerLarge => 300.0;
  double get containerExtraLarge => 400.0;

  // Avatar boyutları
  double get avatarSmall => 32.0;
  double get avatarMedium => 48.0;
  double get avatarLarge => 64.0;
  double get avatarExtraLarge => 96.0;
  double get avatarHuge => 128.0;

  // Card boyutları
  double get cardMinHeight => 120.0;
  double get cardMediumHeight => 180.0;
  double get cardLargeHeight => 240.0;
  double get cardExtraLargeHeight => 320.0;

  // Input boyutları
  double get inputHeight => 48.0;
  double get inputLargeHeight => 56.0;
  double get inputSmallHeight => 40.0;

  // Character Detail Screen boyutları
  double get characterHeaderHeight => 300.0;
  double get characterIconSize => 16.0;
  double get characterInfoRowWidth => 80.0;

  // Divider boyutları
  double get dividerThin => 0.5;
  double get dividerNormal => 1.0;
  double get dividerThick => 2.0;
  double get dividerExtraThick => 4.0;
}

/// Padding değerleri
class PaddingValues {
  const PaddingValues._();

  // Uniform padding
  EdgeInsets get none => EdgeInsets.zero;
  EdgeInsets get micro => const EdgeInsets.all(2.0);
  EdgeInsets get extraSmall => const EdgeInsets.all(4.0);
  EdgeInsets get small => const EdgeInsets.all(8.0);
  EdgeInsets get medium => const EdgeInsets.all(16.0);
  EdgeInsets get large => const EdgeInsets.all(24.0);
  EdgeInsets get extraLarge => const EdgeInsets.all(32.0);
  EdgeInsets get huge => const EdgeInsets.all(48.0);

  // Horizontal padding
  EdgeInsets get horizontalMicro => const EdgeInsets.symmetric(horizontal: 2.0);
  EdgeInsets get horizontalSmall => const EdgeInsets.symmetric(horizontal: 8.0);
  EdgeInsets get horizontalMedium => const EdgeInsets.symmetric(horizontal: 16.0);
  EdgeInsets get horizontalLarge => const EdgeInsets.symmetric(horizontal: 24.0);
  EdgeInsets get horizontalExtraLarge => const EdgeInsets.symmetric(horizontal: 32.0);

  // Vertical padding
  EdgeInsets get verticalMicro => const EdgeInsets.symmetric(vertical: 2.0);
  EdgeInsets get verticalSmall => const EdgeInsets.symmetric(vertical: 8.0);
  EdgeInsets get verticalMedium => const EdgeInsets.symmetric(vertical: 16.0);
  EdgeInsets get verticalLarge => const EdgeInsets.symmetric(vertical: 24.0);
  EdgeInsets get verticalExtraLarge => const EdgeInsets.symmetric(vertical: 32.0);

  // Specific padding combinations
  EdgeInsets get buttonPadding => const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);
  EdgeInsets get cardPadding => const EdgeInsets.all(16.0);
  EdgeInsets get inputPadding => const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  EdgeInsets get screenPadding => const EdgeInsets.all(16.0);
  EdgeInsets get sectionPadding => const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0);
}

/// Margin değerleri
class MarginValues {
  const MarginValues._();

  // Uniform margin
  EdgeInsets get none => EdgeInsets.zero;
  EdgeInsets get micro => const EdgeInsets.all(2.0);
  EdgeInsets get extraSmall => const EdgeInsets.all(4.0);
  EdgeInsets get small => const EdgeInsets.all(8.0);
  EdgeInsets get medium => const EdgeInsets.all(16.0);
  EdgeInsets get large => const EdgeInsets.all(24.0);
  EdgeInsets get extraLarge => const EdgeInsets.all(32.0);

  // Horizontal margin
  EdgeInsets get horizontalSmall => const EdgeInsets.symmetric(horizontal: 8.0);
  EdgeInsets get horizontalMedium => const EdgeInsets.symmetric(horizontal: 16.0);
  EdgeInsets get horizontalLarge => const EdgeInsets.symmetric(horizontal: 24.0);

  // Vertical margin
  EdgeInsets get verticalSmall => const EdgeInsets.symmetric(vertical: 8.0);
  EdgeInsets get verticalMedium => const EdgeInsets.symmetric(vertical: 16.0);
  EdgeInsets get verticalLarge => const EdgeInsets.symmetric(vertical: 24.0);

  // Top margin
  EdgeInsets get topSmall => const EdgeInsets.only(top: 8.0);
  EdgeInsets get topMedium => const EdgeInsets.only(top: 16.0);
  EdgeInsets get topLarge => const EdgeInsets.only(top: 24.0);

  // Bottom margin
  EdgeInsets get bottomSmall => const EdgeInsets.only(bottom: 8.0);
  EdgeInsets get bottomMedium => const EdgeInsets.only(bottom: 16.0);
  EdgeInsets get bottomLarge => const EdgeInsets.only(bottom: 24.0);
}

/// Border değerleri
class BorderValues {
  const BorderValues._();

  // Border radius
  double get radiusMicro => 2.0;
  double get radiusSmall => 4.0;
  double get radiusMedium => 8.0;
  double get radiusLarge => 12.0;
  double get radiusExtraLarge => 16.0;
  double get radiusHuge => 24.0;
  double get radiusRound => 50.0;
  double get radiusCircle => 100.0;

  // BorderRadius objects
  BorderRadius get radiusMicroBR => BorderRadius.circular(radiusMicro);
  BorderRadius get radiusSmallBR => BorderRadius.circular(radiusSmall);
  BorderRadius get radiusMediumBR => BorderRadius.circular(radiusMedium);
  BorderRadius get radiusLargeBR => BorderRadius.circular(radiusLarge);
  BorderRadius get radiusExtraLargeBR => BorderRadius.circular(radiusExtraLarge);
  BorderRadius get radiusHugeBR => BorderRadius.circular(radiusHuge);

  // Border width
  double get widthThin => 0.5;
  double get widthNormal => 1.0;
  double get widthThick => 2.0;
  double get widthExtraThick => 3.0;
  double get widthBold => 4.0;
}

/// Animation değerleri
class AnimationValues {
  const AnimationValues._();

  // Duration değerleri
  Duration get instant => const Duration(milliseconds: 0);
  Duration get veryFast => const Duration(milliseconds: 100);
  Duration get fast => const Duration(milliseconds: 150);
  Duration get normal => const Duration(milliseconds: 300);
  Duration get slow => const Duration(milliseconds: 500);
  Duration get verySlow => const Duration(milliseconds: 800);
  Duration get extraSlow => const Duration(milliseconds: 1200);

  // Curve değerleri
  Curve get easeIn => Curves.easeIn;
  Curve get easeOut => Curves.easeOut;
  Curve get easeInOut => Curves.easeInOut;
  Curve get bounceIn => Curves.bounceIn;
  Curve get bounceOut => Curves.bounceOut;
  Curve get elasticIn => Curves.elasticIn;
  Curve get elasticOut => Curves.elasticOut;
}

/// Text style değerleri
class TextStyleValues {
  const TextStyleValues._();

  // Font boyutları
  double get fontExtraSmall => 10.0;
  double get fontSmall => 12.0;
  double get fontMedium => 14.0;
  double get fontLarge => 16.0;
  double get fontExtraLarge => 18.0;
  double get fontHuge => 20.0;
  double get fontMassive => 24.0;
  double get fontGigantic => 28.0;
  double get fontColossal => 32.0;
  double get fontTitanic => 48.0;

  // Text styles
  TextStyle get caption => GoogleFonts.roboto(
    fontSize: fontSmall,
    color: AppColors.lightText,
  );

  TextStyle get body => GoogleFonts.roboto(
    fontSize: fontMedium,
    color: AppColors.darkText,
  );

  TextStyle get bodyLarge => GoogleFonts.roboto(
    fontSize: fontLarge,
    color: AppColors.darkText,
  );

  TextStyle get heading => GoogleFonts.cinzel(
    fontSize: fontMassive,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  TextStyle get title => GoogleFonts.cinzel(
    fontSize: fontGigantic,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBrown,
  );

  TextStyle get titleLarge => GoogleFonts.cinzel(
    fontSize: fontColossal,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBrown,
  );

  TextStyle get button => GoogleFonts.cinzel(
    fontSize: fontLarge,
    fontWeight: FontWeight.w600,
  );

  TextStyle get score => GoogleFonts.cinzel(
    fontSize: fontTitanic,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextStyle get label => GoogleFonts.roboto(
    fontSize: fontSmall,
    fontWeight: FontWeight.w500,
    color: AppColors.darkText,
  );

  TextStyle get hint => GoogleFonts.roboto(
    fontSize: fontSmall,
    color: AppColors.lightText.withOpacity(0.6),
  );
}

/// Elevation değerleri
class ElevationValues {
  const ElevationValues._();

  double get none => 0.0;
  double get minimal => 1.0;
  double get small => 2.0;
  double get medium => 4.0;
  double get large => 8.0;
  double get extraLarge => 12.0;
  double get huge => 16.0;
  double get massive => 24.0;
}

/// Opacity değerleri
class OpacityValues {
  const OpacityValues._();

  double get transparent => 0.0;
  double get veryFaint => 0.1;
  double get faint => 0.2;
  double get light => 0.3;
  double get medium => 0.5;
  double get strong => 0.6;
  double get veryStrong => 0.7;
  double get nearOpaque => 0.8;
  double get almostOpaque => 0.9;
  double get opaque => 1.0;
}

/// String sabitleri - Tüm uygulama metinleri
class AppStrings {
  const AppStrings._();

  // Profile Screen
  String get profileTitle => 'Profil';
  String get avatarSelection => 'Avatarını Seç';
  String get favoriteCharacter => 'Favori karakterini seç:';
  String get editUsername => 'İsmi Düzenle';
  String get usernameLabel => 'Kullanıcı Adı';
  String get usernameHint => 'Yeni isminizi yazın';
  String get enterUsername => 'İsminizi Girin';
  String get cancel => 'İptal';
  String get save => 'Kaydet';
  String get close => 'Kapat';
  String get avatarUpdated => 'Avatar güncellendi!';
  String get usernameUpdated => 'İsminiz güncellendi!';
  String get usernameCannotBeEmpty => 'İsim boş olamaz!';
  String get guest => 'Guest';
  String get resetProfile => 'Profili Sıfırla';
  String get profileReset => 'Profil sıfırlandı';

  // Profile Stats
  String get achievements => 'Başarılar';

  // Settings Screen
  String get settingsTitle => 'Ayarlar';
  String get soundSettings => 'Ses Ayarları';
  String get disableSound => 'Sesleri Kapat';
  String get enableSound => 'Sesleri Aç';
  String get backgroundMusic => 'Arka Plan Müziği';
  String get characterSounds => 'Karakter Sesleri';
  String get allSoundsOn => 'Tüm sesler açık';
  String get allSoundsOff => 'Tüm sesler kapalı';
  String get playing => 'Çalıyor';
  String get stopped => 'Durduruldu';
  String get characterSoundsInfo => 'Karakter detay sayfalarında oynatma butonuna basarak karakter seslerini dinleyebilirsiniz.';

  // App Info
  String get appTitle => 'YÜZÜKLERIN EFENDİSİ BİLGİ YARIŞMASI';
  String get splashMainTitle => 'YÜZÜKLERIN EFENDİSİ';
  String get splashSubTitle => 'BİLGİ YARIŞMASI';

  // Navigation
  String get mainMenu => 'Ana Menü';
  String get map => 'Harita';
  String get profile => 'Profil';

  // Quiz Results
  String get quizComplete => 'Quiz Tamamlandı';
  String get category => 'Kategori';
  String get backToMenu => 'Ana Menüye Dön';
  String get tryAgain => 'Tekrar Dene';
  String get excellent => 'Mükemmel!';
  String get veryGood => 'Çok İyi!';
  String get good => 'İyi!';
  String get notBad => 'Fena Değil';
  String get needsImprovement => 'Geliştirilmeli';
  String get studyMore => 'Daha Çok Çalışmalısın';

  // Quiz Screen
  String get question => 'Soru';
  String get nextQuestion => 'Sonraki Soru';
  String get startQuiz => 'Bilgi Yarışması Başlat';
  String get finishQuiz => 'Quiz\'i Bitir';
  String get quitQuiz => 'Quiz\'den Çık';
  String get quitQuizMessage => 'Çıkmak istediğinizden emin misiniz? İlerlemeniz kaybolacak.';
  String get continue_ => 'Devam Et';
  String get quit => 'Çık';

  // Region Details
  String get regionNotFound => 'Bölge Bulunamadı';
  String get regionNotFoundMessage => 'Bu bölge bulunamadı.';
  String get generalInfo => 'Genel Bilgi';
  String get history => 'Tarihçe';
  String get importantCharacters => 'Önemli Karakterler';
  String get importantPlaces => 'Önemli Yerler';

  // Region Descriptions
  String get shireDescription => 'Shire, Hobbitlerin huzurlu evi olarak bilinir. Üçüncü Çağ\'da kurulmuş olan bu bölge, yeşil tepeleri, verimli toprakları ve küçük hobbit delikleriyle ünlüdür. Frodo ve Bilbo Baggins\'in evi Bag End burada yer alır. Shire, Orta Dünya\'nın en huzurlu köşelerinden biridir.';
  String get rohanDescription => 'Rohan, at sürücülerin ülkesi olarak bilinir. Rohirrim halkı cesur savaşçılar ve usta binicilerdir. Kral Théoden\'in hüküm sürdüğü bu krallık, Helm\'s Deep ve Edoras gibi önemli kalelerle korunur. Gondor\'un sadık müttefikidir.';
  String get gondorDescription => 'Gondor, İnsanların en büyük krallığıdır. Başkenti Minas Tirith, Beyaz Şehir olarak bilinir. Numenor\'dan gelen Dúnedain\'ların kurduğu bu krallık, binlerce yıldır Mordor\'a karşı savaşmıştır. Aragorn\'un tahta çıkmasıyla tekrar güçlenmiştir.';
  String get fangornDescription => 'Fangorn Ormanı, Entlerin yaşadığı antik ormandır. Treebeard\'ın önderliğindeki Entler, ağaçların koruyucusudur. Bu orman, Orta Dünya\'nın en eski canlı varlıklarının evidir ve büyülü bir atmosfere sahiptir.';
  String get mordorDescription => 'Mordor, Karanlık Lord Sauron\'un ülkesidir. Mount Doom\'da dövülmüş Tek Yüzük\'ün gücüyle yönetilen bu bölge, Orkların ve diğer karanlık yaratıkların evidir. Barad-dûr kulesi, Sauron\'un gücünün merkezi olarak bilinir.';
  String get rivendellDescription => 'Rivendell, Elrond\'un evi olarak bilinen Elf sığınağıdır. İmladris olarak da adlandırılan bu yer, Orta Dünya\'nın en güvenli yerlerinden biridir. Yüzüklerin Konseyi burada toplanmış ve Frodo\'nun yolculuğu buradan başlamıştır.';

  // Character Details
  String get characterNotFound => 'Karakter Bulunamadı';
  String get characterNotFoundMessage => 'Karakter bulunamadı';
  String get basicInfo => 'Temel Bilgiler';
  String get name => 'Ad';
  String get nickname => 'Lakap';
  String get race => 'Irk';
  String get height => 'Boy';
  String get weight => 'Kilo';
  String get weaponsAndEquipment => 'Silahlar ve Ekipmanlar';
  String get specialAbilities => 'Özel Yetenekler';
  String get story => 'Hikaye';

  // Quiz Formats
  String outOf(int score, int total) => '$score/$total';
  String percentageFormat(double percentage) => '%${percentage.toInt()}';

  // Main Menu Strings
  String get appMainTitle => 'Yüzüklerin Efendisi\nBilgi Yarışması';
  String get music => 'Müzik';
  String get settings => 'Ayarlar';
  String get characters => 'Karakterler';

  // Map Screen
  String get mapTitle => 'Orta Dünya Haritası';

  // Stats
  String get quiz => 'Quiz';
  String get score => 'Skor';
  String get accuracy => 'Doğruluk';

  // Common Actions
  String get ok => 'Tamam';
  String get yes => 'Evet';
  String get no => 'Hayır';
  String get confirm => 'Onayla';
  String get delete => 'Sil';
  String get edit => 'Düzenle';
  String get add => 'Ekle';
  String get update => 'Güncelle';
  String get back => 'Geri';
  String get next => 'İleri';
  String get finish => 'Bitir';
  String get skip => 'Atla';

  // Error Messages
  String get error => 'Hata';
  String get warning => 'Uyarı';
  String get success => 'Başarılı';
  String get info => 'Bilgi';
  String get unknownError => 'Bilinmeyen hata oluştu';
  String get networkError => 'Ağ bağlantısı hatası';
  String get connectionTimeout => 'Bağlantı zaman aşımı';

  // Loading States
  String get loading => 'Yükleniyor...';
  String get processing => 'İşleniyor...';
  String get pleaseWait => 'Lütfen bekleyiniz...';
  String get almostDone => 'Neredeyse bitti...';
}
