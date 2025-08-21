/*
 * SETTINGS SCREEN - Ayarlar Ekranı
 * 
 * Uygulama ayarlarını yönetmek için kullanılan ekran.
 * Ses ayarları, tema tercihleri ve diğer konfigürasyonlar.
 * 
 * Özellikler:
 * - Ses açma/kapama toggle'ı
 * - Arka plan müziği kontrolü
 * - Karakter sesleri kontrolü
 * - Ses seviyesi ayarları
 * - Settings'lerin kalıcı saklanması
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import '../services/audio_service.dart';
import '../utils/app_colors.dart';

/// Ayarlar ekranı widget'ı
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AudioService _audioService = AudioService();
  bool _isSoundEnabled = true;

  @override
  void initState() {
    super.initState();
    // Mevcut ses durumunu al
    _isSoundEnabled = _audioService.isSoundEnabled;
  }

  // Ses durumunu toggle etme fonksiyonu
  void _toggleSound() async {
    await _audioService.toggleSound();
    setState(() {
      _isSoundEnabled = _audioService.isSoundEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.strings.settingsTitle,
          style: GoogleFonts.cinzel(
            fontSize: AppConstants.textStyles.fontExtraLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryBrown,
        foregroundColor: AppColors.goldYellow,
        elevation: AppConstants.elevation.medium,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppConstants.backgroundGradient,
        ),
        child: ListView(
          padding: AppConstants.padding.screenPadding,
          children: [
            // Ses Ayarları Başlığı
            Padding(
              padding: AppConstants.padding.verticalMedium,
              child: Text(
                AppConstants.strings.soundSettings,
                style: AppConstants.textStyles.heading,
              ),
            ),

            // Ana Ses Kontrolü
            _buildSettingCard(
              title: _isSoundEnabled 
                  ? AppConstants.strings.disableSound
                  : AppConstants.strings.enableSound,
              subtitle: _isSoundEnabled
                  ? AppConstants.strings.allSoundsOn
                  : AppConstants.strings.allSoundsOff,
              icon: _isSoundEnabled ? Icons.volume_up : Icons.volume_off,
              trailing: Switch(
                value: _isSoundEnabled,
                onChanged: (value) => _toggleSound(),
                activeColor: AppColors.goldYellow,
                activeTrackColor: AppColors.primaryBrown.withOpacity(AppConstants.opacity.medium),
              ),
            ),

            SizedBox(height: AppConstants.spacing.medium),

            // Arka Plan Müziği Kontrolü
            _buildSettingCard(
              title: AppConstants.strings.backgroundMusic,
              subtitle: _audioService.isBackgroundMusicPlaying
                  ? AppConstants.strings.playing
                  : AppConstants.strings.stopped,
              icon: Icons.music_note,
              trailing: _isSoundEnabled 
                  ? IconButton(
                      onPressed: () async {
                        if (_audioService.isBackgroundMusicPlaying) {
                          await _audioService.stopBackgroundMusic();
                        } else {
                          await _audioService.playBackgroundMusic();
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        _audioService.isBackgroundMusicPlaying 
                            ? Icons.pause 
                            : Icons.play_arrow,
                        color: AppColors.primaryBrown,
                      ),
                    )
                  : null,
            ),

            SizedBox(height: AppConstants.spacing.medium),

            // Karakter Sesleri Bilgi Kartı
            _buildInfoCard(
              title: AppConstants.strings.characterSounds,
              subtitle: AppConstants.strings.characterSoundsInfo,
              icon: Icons.person,
            ),

            SizedBox(height: AppConstants.spacing.large),
          ],
        ),
      ),
    );
  }

  /// Ayar kartı oluşturma fonksiyonu
  Widget _buildSettingCard({
    required String title,
    required String subtitle,
    required IconData icon,
    Widget? trailing,
  }) {
    return Card(
      elevation: AppConstants.elevation.small,
      shape: RoundedRectangleBorder(
        borderRadius: AppConstants.borderRadiusM,
      ),
      child: ListTile(
        leading: Container(
          padding: AppConstants.padding.small,
          decoration: BoxDecoration(
            color: AppColors.primaryBrown.withOpacity(AppConstants.opacity.light),
            borderRadius: AppConstants.borderRadiusS,
          ),
          child: Icon(
            icon,
            color: AppColors.primaryBrown,
            size: AppConstants.sizes.iconMedium,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.cinzel(
            fontSize: AppConstants.textStyles.fontLarge,
            fontWeight: FontWeight.w600,
            color: AppColors.darkText,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.roboto(
            fontSize: AppConstants.textStyles.fontMedium,
            color: AppColors.lightText,
          ),
        ),
        trailing: trailing,
        contentPadding: AppConstants.padding.medium,
      ),
    );
  }

  /// Bilgi kartı oluşturma fonksiyonu
  Widget _buildInfoCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Card(
      elevation: AppConstants.elevation.small,
      color: AppColors.lightParchment,
      shape: RoundedRectangleBorder(
        borderRadius: AppConstants.borderRadiusM,
      ),
      child: ListTile(
        leading: Container(
          padding: AppConstants.padding.small,
          decoration: BoxDecoration(
            color: AppColors.info.withOpacity(AppConstants.opacity.light),
            borderRadius: AppConstants.borderRadiusS,
          ),
          child: Icon(
            icon,
            color: AppColors.info,
            size: AppConstants.sizes.iconMedium,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.cinzel(
            fontSize: AppConstants.textStyles.fontLarge,
            fontWeight: FontWeight.w600,
            color: AppColors.darkText,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.roboto(
            fontSize: AppConstants.textStyles.fontMedium,
            color: AppColors.lightText,
          ),
        ),
        contentPadding: AppConstants.padding.medium,
      ),
    );
  }
}
