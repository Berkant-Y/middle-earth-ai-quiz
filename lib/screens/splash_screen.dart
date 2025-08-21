/*
 * SPLASH SCREEN - Açılış Ekranı
 * 
 * Bu ekran uygulamanın açılış anında gösterilir.
 * Netflix tarzı kısa ve etkili bir splash screen tasarımı.
 * 
 * Özellikler:
 * - 1.5 saniye süre (hızlı geçiş)
 * - Animasyonlu logo (fade-in + scale effect)
 * - Responsive tasarım (tüm ekran boyutlarına uyum)
 * - Siyah arka plan (premium görünüm)
 * - LOTR temalı ring logo ve Türkçe başlık
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import '../utils/app_colors.dart';
import 'bottom_navigation_screen.dart';

// Splash Screen Widget - Uygulamanın giriş ekranı
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// Splash Screen State - Animasyon kontrolü için SingleTickerProviderStateMixin kullanır
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  // Animasyon kontrolcüsü - tüm animasyonları yönetir
  late AnimationController _animationController;
  
  // Fade animasyonu - opacity değişimi (0.0 -> 1.0)
  late Animation<double> _fadeAnimation;
  
  // Scale animasyonu - boyut değişimi (0.8 -> 1.0)
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Animasyon kontrolcüsünü başlat (1 saniye süre)
    _animationController = AnimationController(
      duration: AppConstants.animation.normal,
      vsync: this,
    );
    
    // Fade animasyonu tanımla - yumuşak geçiş için easeIn curve
    _fadeAnimation = Tween<double>(
      begin: AppConstants.opacity.transparent,
      end: AppConstants.opacity.opaque,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: AppConstants.animation.easeIn,
    ));
    
    // Scale animasyonu tanımla - elastik efekt için elasticOut curve
    _scaleAnimation = Tween<double>(
      begin: AppConstants.opacity.nearOpaque,
      end: AppConstants.opacity.opaque,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: AppConstants.animation.elasticOut,
    ));
    
    // Animasyonları başlat
    _startAnimation();
    
    // Ana menüye geçiş zamanlamasını başlat
    _navigateToHome();
  }

  // Animasyonu başlatan fonksiyon
  _startAnimation() {
    _animationController.forward();
  }

  // Ana menüye geçiş fonksiyonu - Netflix tarzı kısa süre
  _navigateToHome() async {
    // 1.5 saniye bekle (Netflix tarzı hızlı geçiş)
    await Future.delayed(AppConstants.animation.extraSlow);
    
    // Widget hala aktifse ana menüye geç
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
      );
    }
  }

  @override
  void dispose() {
    // Animasyon kontrolcüsünü temizle (memory leak önlemi)
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ekran boyutlarını al (responsive tasarım için)
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    // Responsive font boyutları - ekran boyutuna göre değişir
    final titleFontSize = screenWidth > 600
        ? AppConstants.textStyles.fontColossal 
        : AppConstants.textStyles.fontGigantic;
    final subtitleFontSize = screenWidth > 600
        ? AppConstants.textStyles.fontGigantic 
        : AppConstants.textStyles.fontExtraLarge;
    final ringSize = screenWidth > 600
        ? AppConstants.sizes.containerLarge 
        : AppConstants.sizes.containerSmall;
    
    return Scaffold(
      backgroundColor: Colors.black, // Netflix tarzı siyah arka plan
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value, // Opacity animasyonu (fade-in effect)
              child: Transform.scale(
                scale: _scaleAnimation.value, // Scale animasyonu (zoom-in effect)
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // LOTR Ring Logo - Animasyonlu yüzük ikonu
                    Container(
                      width: ringSize,
                      height: ringSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.goldYellow,
                          width: screenWidth > 600
                              ? AppConstants.border.widthExtraThick 
                              : AppConstants.border.widthThick,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.goldYellow.withOpacity(AppConstants.opacity.nearOpaque),
                            blurRadius: AppConstants.spacing.massive,
                            spreadRadius: AppConstants.spacing.extraSmall,
                          ),
                        ],
                      ),
                      child: Center(
                        // İç daire - yüzük içindeki boş alan
                        child: Container(
                          width: ringSize * AppConstants.opacity.medium,
                          height: ringSize * AppConstants.opacity.medium,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * AppConstants.opacity.medium), // Responsive boşluk
                    
                    // Ana başlık - "YÜZÜKLERIN EFENDİSİ"
                    Text(
                      AppConstants.strings.splashMainTitle,
                      style: GoogleFonts.cinzel(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.goldYellow,
                        letterSpacing: screenWidth > 600
                            ? AppConstants.spacing.small 
                            : AppConstants.spacing.micro,
                        shadows: [
                          Shadow(
                            offset: Offset(AppConstants.spacing.micro, AppConstants.spacing.micro),
                            blurRadius: AppConstants.spacing.small,
                            color: Colors.black.withOpacity(AppConstants.opacity.nearOpaque),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * AppConstants.opacity.light), // Responsive boşluk
                    
                    // Alt başlık - "BİLGİ YARIŞMASI"
                    Text(
                      AppConstants.strings.splashSubTitle,
                      style: GoogleFonts.cinzel(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightBrown,
                        letterSpacing: screenWidth > 600
                            ? AppConstants.spacing.medium 
                            : AppConstants.spacing.tiny,
                        shadows: [
                          Shadow(
                            offset: Offset(AppConstants.spacing.micro, AppConstants.spacing.micro),
                            blurRadius: AppConstants.spacing.small,
                            color: Colors.black.withOpacity(AppConstants.opacity.nearOpaque),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
