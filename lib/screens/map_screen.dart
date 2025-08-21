/*
 * MAP SCREEN - Harita Ekranı
 * 
 * Orta Dünya haritasını gösteren ana sayfa.
 * Zoom, pulse animasyon ve tıklanabilir alanlar.
 */

import 'package:flutter/material.dart';
import '../data/region_data.dart';
import '../models/region.dart';
import '../constants/app_constants.dart';
import 'region_detail_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late TransformationController _transformationController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  
  // Dinamik harita yolu
  final String _mapImagePath = 'assets/images/middle_earth_map.jpg';
  
  // Dinamik başlık
  final String _mapTitle = AppConstants.strings.mapTitle;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    
    // Pulse animasyon kontrolcüsü
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    // Sürekli pulse efekti
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_mapTitle),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.amber,
        actions: [
          // Zoom butonları
          IconButton(
            onPressed: _zoomIn,
            icon: const Icon(Icons.zoom_in),
          ),
          IconButton(
            onPressed: _zoomOut,
            icon: const Icon(Icons.zoom_out),
          ),
          IconButton(
            onPressed: _resetZoom,
            icon: const Icon(Icons.center_focus_strong),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B4513),
              Color(0xFF654321),
            ],
          ),
        ),
        child: InteractiveViewer(
          transformationController: _transformationController,
          minScale: 0.5,
          maxScale: 3.0,
          panEnabled: true,
          scaleEnabled: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                // Orta Dünya Haritası
                GestureDetector(
                  onTapDown: _handleMapTap,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_mapImagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                
                // Animasyonlu pinler
                ...RegionData.getAllRegions().map((region) => _buildAnimatedPin(region)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMapTap(TapDownDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final localPosition = details.localPosition;
    
    // Koordinatları normalize et (0.0 - 1.0)
    final double normalizedX = localPosition.dx / box.size.width;
    final double normalizedY = localPosition.dy / box.size.height;
    
    // En yakın bölgeyi bul
    Region? nearestRegion = _findNearestRegion(normalizedX, normalizedY);
    
    if (nearestRegion != null) {
      _openRegionDetail(nearestRegion);
    }
  }

  Region? _findNearestRegion(double tapX, double tapY) {
    Region? nearest;
    double minDistance = double.infinity;
    
    for (Region region in RegionData.getAllRegions()) {
      double distance = _calculateDistance(tapX, tapY, region.x, region.y);
      if (distance < 0.1 && distance < minDistance) { // 0.1 = tıklama toleransı
        minDistance = distance;
        nearest = region;
      }
    }
    
    return nearest;
  }

  double _calculateDistance(double x1, double y1, double x2, double y2) {
    return ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
  }

  Widget _buildAnimatedPin(Region region) {
    return Positioned(
      left: MediaQuery.of(context).size.width * region.x - 25,
      top: MediaQuery.of(context).size.height * region.y - 50,
      child: GestureDetector(
        onTap: () => _openRegionDetail(region),
        child: AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseAnimation.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Pulse ring
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _getRegionColor(region.type).withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      // Ana pin
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getRegionColor(region.type),
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          _getRegionIcon(region.type),
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  // Pin gövdesi
                  Container(
                    width: 3,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _getRegionColor(region.type),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  // Pin gölgesi
                  Container(
                    width: 20,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _zoomIn() {
    final Matrix4 matrix = _transformationController.value.clone();
    matrix.scale(1.2);
    _transformationController.value = matrix;
  }

  void _zoomOut() {
    final Matrix4 matrix = _transformationController.value.clone();
    matrix.scale(0.8);
    _transformationController.value = matrix;
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
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

  void _openRegionDetail(Region region) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegionDetailScreen(regionId: region.id),
      ),
    );
  }
}
