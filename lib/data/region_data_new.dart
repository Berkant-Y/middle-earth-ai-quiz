/*
 * REGION DATA - Bölge Verileri
 * 
 * Orta Dünya'daki tüm bölgelerin bilgilerini içerir.
 */

import '../models/region.dart';

class RegionData {
  static const List<Region> _regions = [
    Region(
      id: 'shire',
      name: 'Shire',
      description: 'Hobbitlerin huzurlu evi. Yeşil tepeler ve güzel çiftliklerle dolu.',
      x: 0.15,
      y: 0.25,
      type: RegionType.shire,
    ),
    Region(
      id: 'rivendell',
      name: 'Rivendell',
      description: 'Elrond\'un evi. Elflerin güvenli sığınağı.',
      x: 0.30,
      y: 0.20,
      type: RegionType.rivendell,
    ),
    Region(
      id: 'rohan',
      name: 'Rohan',
      description: 'At sürücülerin ülkesi. Geniş ovalar ve cesur savaşçılar.',
      x: 0.40,
      y: 0.55,
      type: RegionType.rohan,
    ),
    Region(
      id: 'gondor',
      name: 'Gondor',
      description: 'İnsanların büyük krallığı. Beyaz Şehir Minas Tirith ile ünlü.',
      x: 0.50,
      y: 0.70,
      type: RegionType.gondor,
    ),
    Region(
      id: 'fangorn',
      name: 'Fangorn Ormanı',
      description: 'Ent\'lerin ormanı. Eski ve bilge ağaçların evi.',
      x: 0.35,
      y: 0.45,
      type: RegionType.forest,
    ),
    Region(
      id: 'mordor',
      name: 'Mordor',
      description: 'Karanlık Efendi\'nin ülkesi. Ateş Dağı ve kötülüğün kalbi.',
      x: 0.75,
      y: 0.65,
      type: RegionType.mordor,
    ),
    Region(
      id: 'moria',
      name: 'Moria',
      description: 'Cücelerin eski krallığı. Kazad-dûm\'un derinlikleri.',
      x: 0.32,
      y: 0.35,
      type: RegionType.mountain,
    ),
    Region(
      id: 'isengard',
      name: 'Isengard',
      description: 'Saruman\'ın kalesi. Beyaz El\'in evi, şimdi karanlığa hizmet ediyor.',
      x: 0.25,
      y: 0.50,
      type: RegionType.forest,
    ),
    Region(
      id: 'lothlorien',
      name: 'Lothlórien',
      description: 'Galadriel\'in ülkesi. Altın yapraklı mallorn ağaçlarının ormanı.',
      x: 0.45,
      y: 0.35,
      type: RegionType.forest,
    ),
  ];

  static List<Region> getAllRegions() {
    return _regions;
  }

  static Region? getRegionById(String id) {
    try {
      return _regions.firstWhere((region) => region.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Region> getRegionsByType(RegionType type) {
    return _regions.where((region) => region.type == type).toList();
  }
}
