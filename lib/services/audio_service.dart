/*
 * AUDIO SERVICE - Ses Yönetim Servisi
 * 
 * Uygulama genelinde ses yönetimini sağlar.
 * Ana tema müziği ve karakter sesleri kontrolü.
 * 
 * Özellikler:
 * - Ana tema müziği loop oynatma
 * - Karakter ses dosyalarını oynatma
 * - Ses açma/kapama kontrolü
 * - SharedPreferences ile ayar saklama
 * - Memory management ve dispose işlemleri
 */

import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_strings.dart';

/// Ses yönetim servisi - singleton pattern
class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  // Audio player'lar
  final AudioPlayer _backgroundPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();

  // Ses durumu kontrolü
  bool _isSoundEnabled = true;
  bool _isBackgroundMusicPlaying = false;

  // Getter'lar
  bool get isSoundEnabled => _isSoundEnabled;
  bool get isBackgroundMusicPlaying => _isBackgroundMusicPlaying;

  // SharedPreferences anahtarları
  static const String _soundEnabledKey = 'sound_enabled';

  /// Servis başlatma - uygulama açılışında çağrılır
  Future<void> initialize() async {
    try {
      // Ses ayarlarını yükle
      await _loadSoundSettings();
      
      // Ana tema müziğini başlat (eğer ses açıksa)
      if (_isSoundEnabled) {
        await playBackgroundMusic();
      }
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Ses ayarlarını SharedPreferences'dan yükle
  Future<void> _loadSoundSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isSoundEnabled = prefs.getBool(_soundEnabledKey) ?? true; // Varsayılan: açık
    } catch (e) {
      _isSoundEnabled = true; // Hata durumunda varsayılan değer
    }
  }

  /// Ses ayarlarını SharedPreferences'a kaydet
  Future<void> _saveSoundSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_soundEnabledKey, _isSoundEnabled);
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Ses açma/kapama toggle
  Future<void> toggleSound() async {
    _isSoundEnabled = !_isSoundEnabled;
    await _saveSoundSettings();

    if (_isSoundEnabled) {
      // Ses açıldı - ana tema müziğini başlat
      await playBackgroundMusic();
    } else {
      // Ses kapatıldı - tüm sesleri durdur
      await stopBackgroundMusic();
      await _sfxPlayer.stop();
    }
  }

  /// Kategori müziğini oynat (tek seferlik)
  Future<void> playCategoryMusic(String categoryName) async {
    if (!_isSoundEnabled) return;

    try {
      // Önce mevcut müziği durdur
      await stopBackgroundMusic();
      
      // Kategori müzik yolunu al
      final musicPath = AppStrings.audio.getCategoryMusicPath(categoryName);
      
      await _backgroundPlayer.setSource(AssetSource(
        musicPath.replaceFirst('assets/', '')
      ));
      await _backgroundPlayer.setReleaseMode(ReleaseMode.stop); // Tek seferlik
      await _backgroundPlayer.setVolume(0.3); // %30 volume
      
      // Müzik bittiğinde state'i güncelle
      _backgroundPlayer.onPlayerComplete.listen((event) {
        _isBackgroundMusicPlaying = false;
      });
      
      await _backgroundPlayer.resume();
      _isBackgroundMusicPlaying = true;
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Ana tema müziğini oynat (tek seferlik)
  Future<void> playBackgroundMusic() async {
    if (!_isSoundEnabled || _isBackgroundMusicPlaying) return;

    try {
      await _backgroundPlayer.setSource(AssetSource(
        AppStrings.audio.mainTheme.replaceFirst('assets/', '')
      ));
      await _backgroundPlayer.setReleaseMode(ReleaseMode.stop); // Loop yerine stop
      await _backgroundPlayer.setVolume(0.3); // %30 volume (background music)
      
      // Müzik bittiğinde state'i güncelle
      _backgroundPlayer.onPlayerComplete.listen((event) {
        _isBackgroundMusicPlaying = false;
      });
      
      await _backgroundPlayer.resume();
      _isBackgroundMusicPlaying = true;
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Ana tema müziğini durdur
  Future<void> stopBackgroundMusic() async {
    if (!_isBackgroundMusicPlaying) {
      return;
    }
    
    try {
      // Volume'u sıfırla ve durdur
      await _backgroundPlayer.setVolume(0.0);
      await _backgroundPlayer.pause();
      await _backgroundPlayer.stop();
      
      // State'i güncelle
      _isBackgroundMusicPlaying = false;
    } catch (e) {
      // Hata durumunda da state'i güncelle
      _isBackgroundMusicPlaying = false;
    }
  }

  /// Karakter sesini oynat
  Future<void> playCharacterSound(String characterName) async {
    if (!_isSoundEnabled) return;

    try {
      // Önceki ses efektini durdur
      await _sfxPlayer.stop();
      
      // Karakter ses dosyası yolunu al
      final audioPath = AppStrings.audio.getCharacterAudioPath(characterName);
      
      // Ses dosyasını oynat
      await _sfxPlayer.setSource(AssetSource(
        audioPath.replaceFirst('assets/', '')
      ));
      await _sfxPlayer.setVolume(0.8); // %80 volume (character voice)
      await _sfxPlayer.resume();
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// UI ses efekti oynat (gelecekte kullanım için)
  Future<void> playSoundEffect(String soundPath) async {
    if (!_isSoundEnabled) return;

    try {
      await _sfxPlayer.stop();
      await _sfxPlayer.setSource(AssetSource(
        soundPath.replaceFirst('assets/', '')
      ));
      await _sfxPlayer.setVolume(0.6); // %60 volume (UI sounds)
      await _sfxPlayer.resume();
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Ana tema müziği ses seviyesini ayarla
  Future<void> setBackgroundMusicVolume(double volume) async {
    try {
      await _backgroundPlayer.setVolume(volume.clamp(0.0, 1.0));
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Ses efekti seviyesini ayarla
  Future<void> setSoundEffectVolume(double volume) async {
    try {
      await _sfxPlayer.setVolume(volume.clamp(0.0, 1.0));
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Servis temizleme - uygulama kapanışında çağrılır
  Future<void> dispose() async {
    try {
      await _backgroundPlayer.dispose();
      await _sfxPlayer.dispose();
      _isBackgroundMusicPlaying = false;
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Uygulama pause olduğunda çağrılır
  Future<void> pauseAll() async {
    try {
      if (_isBackgroundMusicPlaying) {
        await _backgroundPlayer.pause();
      }
      await _sfxPlayer.pause();
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }

  /// Uygulama resume olduğunda çağrılır
  Future<void> resumeAll() async {
    try {
      if (_isSoundEnabled && _isBackgroundMusicPlaying) {
        await _backgroundPlayer.resume();
      }
    } catch (e) {
      // Hata durumunda sessizce devam et
    }
  }
}
