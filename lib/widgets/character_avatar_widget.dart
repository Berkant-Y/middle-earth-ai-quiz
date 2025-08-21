/*
 * CHARACTER AVATAR WIDGET - Karakter Avatar Widget'ı
 * 
 * Karakterlerin avatar görünümünü sağlayan yeniden kullanılabilir widget.
 * Karakter seçimi ve görüntüleme için kullanılır.
 * 
 * Özellikler:
 * - Karakter resmi görüntüleme
 * - Esnek boyutlandırma
 * - Tıklama etkileşimi
 * - Hata durumu yönetimi
 * - Kategori renk kodlaması
 * - Dairesel avatar tasarımı
 * - LOTR teması uyumlu
 */

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../data/character_data.dart';

// Karakter Avatar Widget - karakter görüntüleme için component
class CharacterAvatarWidget extends StatelessWidget {
  // Gösterilecek karakterin ID'si
  final String characterId;
  // Tıklama callback fonksiyonu
  final VoidCallback onTap;
  // Avatar boyutu (varsayılan 50.0)
  final double size;

  const CharacterAvatarWidget({
    super.key,
    required this.characterId,
    required this.onTap,
    this.size = 50.0,
  });

  // Ana widget yapısı - dairesel avatar görünümü
  @override
  Widget build(BuildContext context) {
    // Karakter verisini getir
    final character = CharacterData.getCharacterById(characterId);
    
    // Karakter bulunamadı durumu
    if (character == null) {
      return const SizedBox.shrink();
    }

    final categoryColor = AppColors.categoryColors[
      character.category.toString().split('.').last
    ] ?? AppColors.primaryBrown;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: categoryColor.withOpacity(0.2),
          border: Border.all(
            color: categoryColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: categoryColor.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipOval(
          child: Stack(
            children: [
              // Background with category color
              Container(
                color: categoryColor.withOpacity(0.1),
              ),
              
              // Character image
              Center(
                child: ClipOval(
                  child: Image.asset(
                    character.imagePath,
                    width: size * 0.8,
                    height: size * 0.8,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        _getCharacterIcon(characterId),
                        size: size * 0.6,
                        color: categoryColor,
                      );
                    },
                  ),
                ),
              ),
              
              // Highlight effect on tap
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  customBorder: const CircleBorder(),
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCharacterIcon(String characterId) {
    switch (characterId) {
      case 'frodo':
        return Icons.person;
      case 'gandalf':
        return Icons.auto_fix_high;
      case 'legolas':
        return Icons.my_location;
      case 'aragorn':
        return Icons.shield;
      case 'gimli':
        return Icons.hardware;
      case 'boromir':
        return Icons.security;
      case 'galadriel':
        return Icons.auto_awesome;
      case 'sauron':
        return Icons.remove_red_eye;
      default:
        return Icons.person;
    }
  }
}
