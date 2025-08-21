/*
 * CHARACTER CATEGORY EXTENSION - Karakter Kategori Uzantıları
 * 
 * CharacterCategory enum'una ekstra özellikler kazandırır.
 * Kategori adları, açıklamaları ve görsel öğeler için yardımcı fonksiyonlar.
 * 
 * Özellikler:
 * - Türkçe kategori adları
 * - Kategori açıklamaları  
 * - Icon path'leri
 * - Renk kodları
 */

import 'package:flutter/material.dart';
import '../models/character.dart';

// Karakter Kategorisi Extension - ek özellikler
extension CharacterCategoryExtension on CharacterCategory {
  // Kategori görüntüleme adı (Türkçe)
  String get displayName {
    switch (this) {
      case CharacterCategory.elves:
        return 'Elfler';
      case CharacterCategory.hobbits:
        return 'Hobbitler';
      case CharacterCategory.dwarves:
        return 'Cüceler';
      case CharacterCategory.men:
        return 'İnsanlar';
      case CharacterCategory.orcsAndDarkForces:
        return 'Orklar ve Karanlık Güçler';
      case CharacterCategory.wizardsAndMaiar:
        return 'Büyücüler ve Maiar';
    }
  }

  // Kategori açıklaması
  String get description {
    switch (this) {
      case CharacterCategory.elves:
        return 'Orta Dünya\'nın bilge ve zarif sakinleri';
      case CharacterCategory.hobbits:
        return 'Shire\'dan cesur küçük kahramanlar';
      case CharacterCategory.dwarves:
        return 'Dağların altında yaşayan usta zanaatkarlar';
      case CharacterCategory.men:
        return 'Gondor ve Rohan\'ın soylu savaşçıları';
      case CharacterCategory.orcsAndDarkForces:
        return 'Karanlığın hizmetkarları ve kötü güçler';
      case CharacterCategory.wizardsAndMaiar:
        return 'Büyücüler ve Maiar ruhları';
    }
  }

  // Kategori ikonu
  IconData get icon {
    switch (this) {
      case CharacterCategory.elves:
        return Icons.forest;
      case CharacterCategory.hobbits:
        return Icons.home;
      case CharacterCategory.dwarves:
        return Icons.terrain;
      case CharacterCategory.men:
        return Icons.security;
      case CharacterCategory.orcsAndDarkForces:
        return Icons.warning;
      case CharacterCategory.wizardsAndMaiar:
        return Icons.auto_fix_high;
    }
  }

  // Kategori icon path'i
  String get iconPath {
    switch (this) {
      case CharacterCategory.elves:
        return 'assets/icons/elves.svg';
      case CharacterCategory.hobbits:
        return 'assets/icons/hobbits.svg';
      case CharacterCategory.dwarves:
        return 'assets/icons/dwarves.svg';
      case CharacterCategory.men:
        return 'assets/icons/men.svg';
      case CharacterCategory.orcsAndDarkForces:
        return 'assets/icons/orcs.svg';
      case CharacterCategory.wizardsAndMaiar:
        return 'assets/icons/wizards.svg';
    }
  }
}
