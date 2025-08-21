/*
 * MAIN APP - Ana Uygulama Dosyası
 * 
 * Lord of the Rings Quiz uygulamasının giriş noktası.
 * Provider pattern ile state yönetimi ve tema konfigürasyonu.
 * 
 * Özellikler:
 * - MultiProvider ile state yönetimi
 * - UserProvider ve QuizProvider entegrasyonu
 * - Google Fonts tema yapılandırması
 * - Material Design theme customization
 * - Splash screen başlatma
 * - App-wide konfigürasyon
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/user_provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/splash_screen.dart';
import 'services/audio_service.dart';
import 'constants/app_constants.dart';
import 'utils/app_colors.dart';

// Ana uygulama başlatma fonksiyonu
void main() async {
  // Flutter binding'i başlat
  WidgetsFlutterBinding.ensureInitialized();
  
  // AudioService'i başlat
  await AudioService().initialize();
  
  runApp(const MiddleEarthQuizApp());
}

// Ana Uygulama Widget - LOTR Quiz App
class MiddleEarthQuizApp extends StatefulWidget {
  const MiddleEarthQuizApp({super.key});

  @override
  State<MiddleEarthQuizApp> createState() => _MiddleEarthQuizAppState();
}

class _MiddleEarthQuizAppState extends State<MiddleEarthQuizApp> with WidgetsBindingObserver {
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioService.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        _audioService.pauseAll();
        break;
      case AppLifecycleState.resumed:
        _audioService.resumeAll();
        break;
      case AppLifecycleState.detached:
        _audioService.dispose();
        break;
      default:
        break;
    }
  }

  // Ana widget yapısı - provider setup ve tema konfigürasyonu
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // State provider'ları tanımla
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()), // Kullanıcı verisi
        ChangeNotifierProvider(create: (context) => QuizProvider()), // Quiz verisi
      ],
      child: MaterialApp(
        title: AppConstants.strings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryBrown,
            brightness: Brightness.light,
          ),
          textTheme: GoogleFonts.cinzelTextTheme().copyWith(
            bodyMedium: GoogleFonts.roboto(),
            bodySmall: GoogleFonts.roboto(),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryBrown,
            foregroundColor: AppColors.goldYellow,
            titleTextStyle: GoogleFonts.cinzel(
              fontSize: AppConstants.textStyles.fontExtraLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.goldYellow,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBrown,
              foregroundColor: AppColors.goldYellow,
              textStyle: GoogleFonts.cinzel(
                fontSize: AppConstants.textStyles.fontLarge,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
