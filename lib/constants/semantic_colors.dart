/*
 * SEMANTIC COLORS - Anlamsal Renk Sistemi
 * 
 * Renkleri anlamlarına göre kategorize eder.
 * Hardcoded Colors.white, Colors.red gibi kullanımları önler.
 * 
 * Kullanım:
 * - SemanticColors.surface.primary
 * - SemanticColors.text.onPrimary
 * - SemanticColors.state.success
 */

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

/// Anlamsal renk kategorileri
class SemanticColors {
  // Private constructor - static sınıf
  SemanticColors._();

  // ============ SURFACE COLORS ============
  static const SurfaceColors surface = SurfaceColors._();

  // ============ TEXT COLORS ============
  static const TextColors text = TextColors._();

  // ============ STATE COLORS ============
  static const StateColors state = StateColors._();

  // ============ INTERACTIVE COLORS ============
  static const InteractiveColors interactive = InteractiveColors._();

  // ============ BORDER COLORS ============
  static const BorderColors border = BorderColors._();
}

/// Yüzey renkleri (arkaplan, card vb.)
class SurfaceColors {
  const SurfaceColors._();

  // Ana yüzeyler
  Color get primary => AppColors.primaryBrown;
  Color get secondary => AppColors.goldYellow;
  Color get background => AppColors.parchment;
  Color get surface => AppColors.lightParchment;
  
  // Kart yüzeyleri
  Color get card => AppColors.lightParchment;
  Color get cardElevated => Colors.white;
  Color get cardTransparent => Colors.white.withOpacity(0.8);
  
  // Overlay yüzeyleri
  Color get overlay => Colors.black.withOpacity(0.5);
  Color get overlayLight => Colors.black.withOpacity(0.3);
  Color get overlayDark => Colors.black.withOpacity(0.7);
  
  // Transparent yüzeyler
  Color get transparent => Colors.transparent;
  Color get semiTransparent => Colors.white.withOpacity(0.1);
}

/// Metin renkleri
class TextColors {
  const TextColors._();

  // Ana metin renkleri
  Color get primary => AppColors.darkText;
  Color get secondary => AppColors.lightText;
  Color get inverse => Colors.white;
  Color get disabled => AppColors.lightText.withOpacity(0.5);
  
  // Özel durum metin renkleri
  Color get onPrimary => AppColors.goldYellow;      // Primary background üzerindeki metin
  Color get onSecondary => AppColors.primaryBrown;  // Secondary background üzerindeki metin
  Color get onSurface => AppColors.darkText;        // Surface background üzerindeki metin
  Color get onCard => AppColors.darkText;           // Card background üzerindeki metin
  
  // Durum bazlı metin renkleri
  Color get success => Colors.white;                // Success background üzerinde
  Color get error => Colors.white;                  // Error background üzerinde
  Color get warning => Colors.black87;              // Warning background üzerinde
  Color get info => Colors.white;                   // Info background üzerinde
  
  // Opacity varyasyonları
  Color get hint => AppColors.lightText.withOpacity(0.6);
  Color get placeholder => AppColors.lightText.withOpacity(0.4);
  Color get caption => AppColors.darkText.withOpacity(0.7);
}

/// Durum renkleri (başarı, hata vb.)
class StateColors {
  const StateColors._();

  // Ana durum renkleri
  Color get success => AppColors.correct;
  Color get error => AppColors.incorrect;
  Color get warning => AppColors.warning;
  Color get info => AppColors.info;
  
  // Performans renkleri
  Color get excellent => AppColors.correct;         // %90+ için
  Color get good => AppColors.info;                 // %70-89 için
  Color get average => AppColors.warning;           // %50-69 için
  Color get poor => AppColors.incorrect;            // %0-49 için
  
  // Quiz durum renkleri
  Color get correct => AppColors.correct;
  Color get incorrect => AppColors.incorrect;
  Color get unanswered => AppColors.lightText;
  Color get selected => AppColors.info;
  
  // Varyasyonlar
  Color get successLight => AppColors.correct.withOpacity(0.1);
  Color get errorLight => AppColors.incorrect.withOpacity(0.1);
  Color get warningLight => AppColors.warning.withOpacity(0.1);
  Color get infoLight => AppColors.info.withOpacity(0.1);
}

/// Etkileşimli element renkleri (buton, link vb.)
class InteractiveColors {
  const InteractiveColors._();

  // Buton durumları
  Color get buttonPrimary => AppColors.primaryBrown;
  Color get buttonSecondary => AppColors.lightParchment;
  Color get buttonSuccess => AppColors.correct;
  Color get buttonError => AppColors.incorrect;
  Color get buttonDisabled => AppColors.lightText.withOpacity(0.3);
  
  // Hover durumları
  Color get hoverPrimary => AppColors.primaryBrown.withOpacity(0.8);
  Color get hoverSecondary => AppColors.lightParchment.withOpacity(0.8);
  Color get hoverSurface => AppColors.lightParchment.withOpacity(0.5);
  
  // Press durumları
  Color get pressPrimary => AppColors.primaryBrown.withOpacity(0.6);
  Color get pressSecondary => AppColors.lightParchment.withOpacity(0.6);
  
  // Link renkleri
  Color get link => AppColors.info;
  Color get linkVisited => AppColors.primaryBrown;
  Color get linkHover => AppColors.info.withOpacity(0.8);
  
  // Selection renkleri
  Color get selectionBackground => AppColors.info.withOpacity(0.2);
  Color get selectionBorder => AppColors.info;
  Color get focus => AppColors.info.withOpacity(0.3);
}

/// Border renkleri
class BorderColors {
  const BorderColors._();

  // Ana border renkleri
  Color get primary => AppColors.primaryBrown.withOpacity(0.3);
  Color get secondary => AppColors.lightText.withOpacity(0.2);
  Color get disabled => AppColors.lightText.withOpacity(0.1);
  
  // Durum bazlı border'lar
  Color get success => AppColors.correct.withOpacity(0.5);
  Color get error => AppColors.incorrect.withOpacity(0.5);
  Color get warning => AppColors.warning.withOpacity(0.5);
  Color get info => AppColors.info.withOpacity(0.5);
  
  // Etkileşim border'ları
  Color get focused => AppColors.info;
  Color get hovered => AppColors.primaryBrown.withOpacity(0.5);
  Color get selected => AppColors.info;
  
  // Thickness varyasyonları
  double get thin => 0.5;
  double get normal => 1.0;
  double get thick => 2.0;
  double get extraThick => 3.0;
}

/// Renk yardımcı fonksiyonları
extension ColorHelpers on Color {
  /// Rengin daha açık versiyonunu döndürür
  Color get lighter => Color.lerp(this, Colors.white, 0.3) ?? this;
  
  /// Rengin daha koyu versiyonunu döndürür  
  Color get darker => Color.lerp(this, Colors.black, 0.3) ?? this;
  
  /// Rengin muted (yumuşak) versiyonunu döndürür
  Color get muted => withOpacity(0.6);
  
  /// Rengin subtle (ince) versiyonunu döndürür
  Color get subtle => withOpacity(0.1);
  
  /// Rengin contrast (zıt) versiyonunu döndürür
  Color get contrast {
    final luminance = computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
