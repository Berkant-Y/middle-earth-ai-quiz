/*
 * DIALOG SERVICE - Dialog Hizmet Sınıfı
 * 
 * Tüm dialog işlemlerini merkezi olarak yöneten service sınıfı.
 * Ayarlar, onay dialog'ları ve bottom sheet'leri yönetir.
 * 
 * Özellikler:
 * - Ayarlar dialog'u
 * - Onay dialog'ları (profil sıfırlama, quiz çıkış)
 * - Karakterler bottom sheet'i
 * - Tutarlı UI ve UX
 * - Merkezi dialog yönetimi
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../data/character_data.dart';
import '../widgets/character_avatar_widget.dart';
import 'navigation_service.dart';

// Dialog Service - merkezi dialog yönetimi
class DialogService {
  // Ayarlar dialog'unu göster
  static void showSettings(
    BuildContext context, {
    required bool isMusicEnabled,
    required Function(bool) onMusicChanged,
  }) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.parchment,
            title: Text(
              'Ayarlar',
              style: TextStyle(
                fontFamily: 'Cinzel',
                color: AppColors.darkText,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    isMusicEnabled ? Icons.music_note : Icons.music_off,
                    color: AppColors.primaryBrown,
                  ),
                  title: Text(
                    'Müzik',
                    style: TextStyle(
                      fontFamily: 'Cinzel',
                      color: AppColors.darkText,
                    ),
                  ),
                  trailing: Switch(
                    value: isMusicEnabled,
                    onChanged: (value) {
                      setState(() {
                        onMusicChanged(value);
                      });
                      NavigationService.closeDialog(context);
                    },
                    activeColor: AppColors.primaryBrown,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => NavigationService.closeDialog(context),
                child: Text(
                  'Kapat',
                  style: TextStyle(
                    color: AppColors.primaryBrown,
                    fontFamily: 'Cinzel',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Quiz çıkış onay dialog'u
  static void showQuizExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.parchment,
        title: Text(
          'Quiz\'ten Çık',
          style: GoogleFonts.cinzel(
            color: AppColors.darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Quiz\'ten çıkmak istediğinizden emin misiniz? İlerlemeniz kaybedilecek.',
          style: GoogleFonts.cinzel(color: AppColors.darkText),
        ),
        actions: [
          TextButton(
            onPressed: () => NavigationService.closeDialog(context),
            child: Text(
              'Devam Et',
              style: TextStyle(color: AppColors.primaryBrown),
            ),
          ),
          TextButton(
            onPressed: () => NavigationService.exitQuiz(context),
            child: Text(
              'Çık',
              style: TextStyle(color: AppColors.incorrect),
            ),
          ),
        ],
      ),
    );
  }

  // Profil sıfırlama onay dialog'u
  static void showResetProfileConfirmation(
    BuildContext context,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.parchment,
        title: Text(
          'Profili Sıfırla',
          style: GoogleFonts.cinzel(
            color: AppColors.darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Profilinizi sıfırlamak istediğinizden emin misiniz? Tüm ilerlemeniz silinecek ve geri alınamaz.',
          style: GoogleFonts.cinzel(color: AppColors.darkText),
        ),
        actions: [
          TextButton(
            onPressed: () => NavigationService.closeDialog(context),
            child: Text(
              'İptal',
              style: TextStyle(color: AppColors.primaryBrown),
            ),
          ),
          TextButton(
            onPressed: () {
              NavigationService.closeDialog(context);
              onConfirm();
            },
            child: Text(
              'Sıfırla',
              style: TextStyle(color: AppColors.incorrect),
            ),
          ),
        ],
      ),
    );
  }

  // Karakterler bottom sheet'ini göster
  static void showCharactersBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 300,
        decoration: BoxDecoration(
          color: AppColors.parchment,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.primaryBrown,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Karakterler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                  fontFamily: 'Cinzel',
                ),
              ),
            ),

            // Characters grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: CharacterData.getMainCharacterAvatars().length,
                  itemBuilder: (context, index) {
                    final characterId = CharacterData.getMainCharacterAvatars()[index];
                    return CharacterAvatarWidget(
                      characterId: characterId,
                      onTap: () {
                        NavigationService.back(context); // Bottom sheet kapat
                        NavigationService.toCharacterDetail(context, characterId);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
