/*
 * REGION MODEL - Bölge Veri Modeli
 * 
 * Orta Dünya'daki bölgelerin veri yapısını tanımlar.
 */

class Region {
  final String id;
  final String name;
  final String description;
  final double x; // Haritadaki X koordinatı (0.0 - 1.0)
  final double y; // Haritadaki Y koordinatı (0.0 - 1.0)
  final String? imagePath; // Bölge resmi (opsiyonel)
  final bool isUnlocked;
  final RegionType type;

  const Region({
    required this.id,
    required this.name,
    required this.description,
    required this.x,
    required this.y,
    this.imagePath,
    this.isUnlocked = true,
    required this.type,
  });
}

enum RegionType {
  shire,    // Hobbiton
  rohan,    // İnsanlar
  gondor,   // İnsanlar
  mordor,   // Karanlık
  forest,   // Ormanlar
  mountain, // Dağlar
  rivendell // Elfler
}
