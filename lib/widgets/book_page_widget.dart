/*
 * BOOK PAGE WIDGET - Kitap Sayfa Widget'ı
 * 
 * Her karakter kategorisi için özel tasarlanmış kitap sayfa görünümü.
 * Ana menüde kategori seçimi için kullanılan interactive widget.
 * 
 * Özellikler:
 * - Kategori bazlı renk kodlaması
 * - 3D kitap sayfa efekti
 * - Quiz başlatma butonu
 * - Kategori karakterlerinin özet görünümü
 * - SVG ikon desteği
 * - Responsive tasarım
 * - LOTR teması ile uyumlu
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/character.dart';
import '../utils/app_colors.dart';
import '../data/character_data.dart';

// Kitap Sayfa Widget - kategori seçimi için interactive sayfa
class BookPageWidget extends StatelessWidget {
  // Gösterilecek karakter kategorisi
  final CharacterCategory category;
  // Quiz başlatma callback fonksiyonu
  final VoidCallback onStartQuiz;
  // Karakter tıklama callback fonksiyonu
  final Function(String)? onCharacterTap;

  const BookPageWidget({
    super.key,
    required this.category,
    required this.onStartQuiz,
    this.onCharacterTap,
  });

  // Ana widget yapısı - kitap sayfa görünümü
  @override
  Widget build(BuildContext context) {
    // Kategoriye ait karakterleri getir
    final characters = CharacterData.getCharactersByCategory(category);
    // Kategori rengini belirle
    final categoryColor = AppColors.categoryColors[category.toString().split('.').last] 
        ?? AppColors.primaryBrown;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category title
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: categoryColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  _getCategoryIconPath(category),
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.displayName,
                      style: GoogleFonts.cinzel(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkText,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      category.description,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: AppColors.darkText.withOpacity(0.7),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Characters preview
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Öne Çıkan Karakterler:',
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkText,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Character cards
                  ...characters.take(3).map((character) => GestureDetector(
                    onTap: () => onCharacterTap?.call(character.id),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: categoryColor.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Character avatar
                          Container(
                            width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage(character.imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 12),
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.name,
                                style: GoogleFonts.cinzel(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkText,
                                ),
                              ),
                              Text(
                                character.nickname,
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: AppColors.darkText.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                character.race,
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: categoryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  )),
                  
                  if (characters.length > 3) ...[
                    const SizedBox(height: 8),
                    Text(
                      '... ve ${characters.length - 3} karakter daha',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: AppColors.darkText.withOpacity(0.6),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Start quiz button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onStartQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: categoryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.quiz, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${category.displayName} Bilgi Yarışması Başlat',
                      style: GoogleFonts.cinzel(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryIconPath(CharacterCategory category) {
    switch (category) {
      case CharacterCategory.elves:
        return 'assets/images/elves_icon.svg';
      case CharacterCategory.hobbits:
        return 'assets/images/hobbits_icon.svg';
      case CharacterCategory.dwarves:
        return 'assets/images/dwarves_icon.svg';
      case CharacterCategory.men:
        return 'assets/images/men_icon.svg';
      case CharacterCategory.orcsAndDarkForces:
        return 'assets/images/orcs_icon.svg';
      case CharacterCategory.wizardsAndMaiar:
        return 'assets/images/wizards_icon.svg';
    }
  }

  IconData _getCategoryIcon(CharacterCategory category) {
    switch (category) {
      case CharacterCategory.elves:
        return Icons.park;
      case CharacterCategory.hobbits:
        return Icons.home;
      case CharacterCategory.dwarves:
        return Icons.terrain;
      case CharacterCategory.men:
        return Icons.shield;
      case CharacterCategory.orcsAndDarkForces:
        return Icons.warning;
      case CharacterCategory.wizardsAndMaiar:
        return Icons.auto_fix_high;
    }
  }
}
