/*
 * REGION DETAIL SCREEN - Bölge Detay Ekranı
 * 
 * Seçilen bölgenin detaylı bilgilerini gösteren sayfa.
 * Tarihçe, karakterler, önemli yerler ve resimler.
 */

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/region.dart';
import '../data/region_data.dart';

class RegionDetailScreen extends StatelessWidget {
  final String regionId;

  const RegionDetailScreen({super.key, required this.regionId});

  @override
  Widget build(BuildContext context) {
    final region = RegionData.getRegionById(regionId);
    
    if (region == null) {
      return Scaffold(
        appBar: AppBar(title: Text(AppConstants.strings.regionNotFound)),
        body: Center(child: Text(AppConstants.strings.regionNotFoundMessage)),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Büyük header resim
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: _getRegionColor(region.type),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                region.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Bölge resmi varsa göster, yoksa gradient
                  region.imagePath != null
                      ? Image.asset(
                          region.imagePath!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Resim yüklenemezse gradient ve icon göster
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    _getRegionColor(region.type),
                                    _getRegionColor(region.type).withOpacity(0.7),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  _getRegionIcon(region.type),
                                  size: 80,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                _getRegionColor(region.type),
                                _getRegionColor(region.type).withOpacity(0.7),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              _getRegionIcon(region.type),
                              size: 80,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                  // Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // İçerik
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kısa açıklama
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.strings.generalInfo,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            region.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Detaylı tarihçe
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.strings.history,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getRegionHistory(region.id),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Önemli karakterler
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.strings.importantCharacters,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ..._getRegionCharacters(region.id).map((character) => 
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Icon(Icons.person, color: _getRegionColor(region.type)),
                                  const SizedBox(width: 8),
                                  Text(character, style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Önemli yerler
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.strings.importantPlaces,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ..._getRegionPlaces(region.id).map((place) => 
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: _getRegionColor(region.type)),
                                  const SizedBox(width: 8),
                                  Text(place, style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Color _getRegionColor(RegionType type) {
    switch (type) {
      case RegionType.shire:
        return Colors.green;
      case RegionType.rohan:
        return Colors.brown;
      case RegionType.gondor:
        return Colors.blue;
      case RegionType.mordor:
        return Colors.red;
      case RegionType.forest:
        return Colors.green[800]!;
      case RegionType.mountain:
        return Colors.grey;
      case RegionType.rivendell:
        return Colors.purple;
    }
  }

  IconData _getRegionIcon(RegionType type) {
    switch (type) {
      case RegionType.shire:
        return Icons.home;
      case RegionType.rohan:
        return Icons.directions_run;
      case RegionType.gondor:
        return Icons.account_balance;
      case RegionType.mordor:
        return Icons.remove_red_eye;
      case RegionType.forest:
        return Icons.park;
      case RegionType.mountain:
        return Icons.terrain;
      case RegionType.rivendell:
        return Icons.auto_awesome;
    }
  }

  String _getRegionHistory(String regionId) {
    switch (regionId) {
      case 'shire':
        return AppConstants.strings.shireDescription;
      case 'rohan':
        return AppConstants.strings.rohanDescription;
      case 'gondor':
        return AppConstants.strings.gondorDescription;
      case 'fangorn':
        return AppConstants.strings.fangornDescription;
      case 'mordor':
        return AppConstants.strings.mordorDescription;
      case 'rivendell':
        return AppConstants.strings.rivendellDescription;
      case 'moria':
        return 'Moria, Cücelerin eski krallığı Khazad-dûm\'un kalıntılarıdır. Bir zamanlar zengin mithril madenleriyle ünlü olan bu yer, şimdi Balrog\'un gölgesinde karanlık bir labirent haline gelmiştir. Gandalf burada büyük fedakarlık yapmıştır.';
      case 'isengard':
        return 'Isengard, Saruman\'ın kalesi ve Orthanc kulesinin evidir. Bir zamanlar Gondor\'un kalesi olan bu yer, Beyaz Büyücü tarafından ele geçirilmiş ve Uruk-hai ordusu burada yaratılmıştır. Entler tarafından yıkılmıştır.';
      case 'lothlorien':
        return 'Lothlórien, Galadriel ve Celeborn\'un yönettiği Elf krallığıdır. Altın yaprakları olan mallorn ağaçlarıyla ünlü bu orman, Nenya yüzüğünün gücüyle korunur. Yoldaşlık burada dinlenmiş ve Galadriel\'in aynasını görmüştür.';
      default:
        return 'Bu bölge hakkında detaylı bilgi mevcut değil.';
    }
  }

  List<String> _getRegionCharacters(String regionId) {
    switch (regionId) {
      case 'shire':
        return ['Frodo Baggins', 'Bilbo Baggins', 'Samwise Gamgee', 'Meriadoc Brandybuck', 'Peregrin Took'];
      case 'rohan':
        return ['Kral Théoden', 'Éomer', 'Éowyn', 'Háma', 'Gamling'];
      case 'gondor':
        return ['Aragorn (Kral Elessar)', 'Boromir', 'Faramir', 'Denethor', 'Beregond'];
      case 'fangorn':
        return ['Treebeard (Fangorn)', 'Quickbeam', 'Leaflock', 'Skinbark'];
      case 'mordor':
        return ['Sauron', 'Nazgûl', 'Witch-king', 'Mouth of Sauron', 'Gothmog'];
      case 'rivendell':
        return ['Elrond', 'Arwen', 'Glorfindel', 'Erestor', 'Lindir'];
      case 'moria':
        return ['Balin', 'Durin', 'Balrog', 'Gandalf (geçici olarak)'];
      case 'isengard':
        return ['Saruman', 'Grima Wormtongue', 'Uruk-hai', 'Lurtz'];
      case 'lothlorien':
        return ['Galadriel', 'Celeborn', 'Haldir', 'Rumil', 'Orophin'];
      default:
        return ['Bilinmeyen karakterler'];
    }
  }

  List<String> _getRegionPlaces(String regionId) {
    switch (regionId) {
      case 'shire':
        return ['Bag End', 'Hobbiton', 'Bywater', 'Michel Delving', 'Brandywine Bridge'];
      case 'rohan':
        return ['Edoras', 'Helm\'s Deep', 'Isengard Yakınları', 'Fangorn Sınırı', 'Aldburg'];
      case 'gondor':
        return ['Minas Tirith', 'Osgiliath', 'Ithilien', 'Dol Amroth', 'Cair Andros'];
      case 'fangorn':
        return ['Entmoot', 'Derndingle', 'Wellinghall', 'Isengard Sınırı'];
      case 'mordor':
        return ['Barad-dûr', 'Mount Doom', 'Black Gate', 'Minas Morgul', 'Cirith Ungol'];
      case 'rivendell':
        return ['Elrond\'un Evi', 'Ford of Bruinen', 'Hall of Fire', 'Vilya Bahçeleri'];
      case 'moria':
        return ['Bridge of Khazad-dûm', 'Chamber of Mazarbul', 'Hall of Records', 'Dimrill Dale'];
      case 'isengard':
        return ['Orthanc Tower', 'Circle of Orthanc', 'Uruk-hai Pits', 'The Ring of Isengard'];
      case 'lothlorien':
        return ['Caras Galadhon', 'Celebdil the White', 'Nimrodel Stream', 'Cerin Amroth', 'Mirror of Galadriel'];
      default:
        return ['Bilinmeyen yerler'];
    }
  }
}
