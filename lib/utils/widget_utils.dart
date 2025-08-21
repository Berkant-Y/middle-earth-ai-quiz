/*
 * WIDGET UTILS - Widget Yardımcı Fonksiyonları
 * 
 * Yaygın kullanılan widget'lar ve layout helper'ları.
 * Spacing, Dividers, Containers vb. için yardımcı fonksiyonlar.
 * 
 * Kullanım:
 * - WidgetUtils.verticalSpacing(16)
 * - WidgetUtils.horizontalSpacing(20)
 * - WidgetUtils.buildSection()
 */

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/semantic_colors.dart';

/// Widget yardımcı fonksiyonları
class WidgetUtils {
  // Private constructor - static sınıf
  WidgetUtils._();

  // ============ SPACING HELPERS ============
  
  /// Dikey boşluk oluştur
  static Widget verticalSpacing([double? height]) {
    return SizedBox(height: height ?? AppConstants.spacingM);
  }

  /// Yatay boşluk oluştur
  static Widget horizontalSpacing([double? width]) {
    return SizedBox(width: width ?? AppConstants.spacingM);
  }

  /// Küçük dikey boşluk
  static Widget get verticalSpacingS => verticalSpacing(AppConstants.spacingS);
  
  /// Orta dikey boşluk
  static Widget get verticalSpacingM => verticalSpacing(AppConstants.spacingM);
  
  /// Büyük dikey boşluk
  static Widget get verticalSpacingL => verticalSpacing(AppConstants.spacingL);
  
  /// Extra büyük dikey boşluk
  static Widget get verticalSpacingXL => verticalSpacing(AppConstants.spacingXL);
  
  /// Extra extra büyük dikey boşluk
  static Widget get verticalSpacingXXL => verticalSpacing(AppConstants.spacingXXL);

  /// Küçük yatay boşluk
  static Widget get horizontalSpacingS => horizontalSpacing(AppConstants.spacingS);
  
  /// Orta yatay boşluk
  static Widget get horizontalSpacingM => horizontalSpacing(AppConstants.spacingM);
  
  /// Büyük yatay boşluk
  static Widget get horizontalSpacingL => horizontalSpacing(AppConstants.spacingL);

  // ============ LAYOUT HELPERS ============

  /// SafeArea ile padding wrapper
  static Widget buildSafeArea({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return SafeArea(
      child: Padding(
        padding: padding ?? AppConstants.paddingM,
        child: child,
      ),
    );
  }

  /// Scroll wrapper - kaydırılabilir içerik için
  static Widget buildScrollableContent({
    required Widget child,
    EdgeInsets? padding,
    ScrollPhysics? physics,
  }) {
    return SingleChildScrollView(
      physics: physics,
      padding: padding ?? AppConstants.paddingM,
      child: child,
    );
  }

  /// Center wrapper - ortalama için
  static Widget buildCenteredContent({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }

  /// Gradient background wrapper
  static Widget buildGradientBackground({
    required Widget child,
    Gradient? gradient,
  }) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient ?? AppConstants.backgroundGradient,
      ),
      child: child,
    );
  }

  // ============ LIST HELPERS ============

  /// Liste elemanları arasına separator ekle
  static List<Widget> addSeparators({
    required List<Widget> children,
    Widget? separator,
  }) {
    if (children.isEmpty) return children;
    
    final sep = separator ?? verticalSpacingM;
    final result = <Widget>[];
    
    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(sep);
      }
    }
    
    return result;
  }

  /// Row elemanları arasına spacing ekle
  static List<Widget> addHorizontalSpacing({
    required List<Widget> children,
    double? spacing,
  }) {
    if (children.isEmpty) return children;
    
    final space = horizontalSpacing(spacing);
    final result = <Widget>[];
    
    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(space);
      }
    }
    
    return result;
  }

  // ============ DIVIDER HELPERS ============

  /// Standart çizgi ayırıcı
  static Widget get standardDivider => Divider(
    color: SemanticColors.text.secondary.withOpacity(0.3),
    thickness: 1,
  );

  /// İnce çizgi ayırıcı
  static Widget get thinDivider => Divider(
    color: SemanticColors.text.secondary.withOpacity(0.2),
    thickness: 0.5,
  );

  /// Kalın çizgi ayırıcı
  static Widget get thickDivider => Divider(
    color: SemanticColors.text.secondary.withOpacity(0.4),
    thickness: 2,
  );

  // ============ ANIMATION HELPERS ============

  /// Fade transition wrapper
  static Widget buildFadeTransition({
    required Widget child,
    required Animation<double> animation,
  }) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  /// Scale transition wrapper
  static Widget buildScaleTransition({
    required Widget child,
    required Animation<double> animation,
  }) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  /// Slide transition wrapper
  static Widget buildSlideTransition({
    required Widget child,
    required Animation<Offset> animation,
  }) {
    return SlideTransition(
      position: animation,
      child: child,
    );
  }

  // ============ CONDITIONAL HELPERS ============

  /// Koşullu widget gösterme
  static Widget? showIf(bool condition, Widget widget) {
    return condition ? widget : null;
  }

  /// Koşullu widget gösterme - alternatif ile
  static Widget showIfElse(bool condition, Widget ifWidget, Widget elseWidget) {
    return condition ? ifWidget : elseWidget;
  }

  // ============ LOADING HELPERS ============

  /// Loading indicator
  static Widget buildLoadingIndicator({
    Color? color,
    double? size,
  }) {
    return SizedBox(
      width: size ?? AppConstants.iconSizeL,
      height: size ?? AppConstants.iconSizeL,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? SemanticColors.surface.primary,
        ),
        strokeWidth: 2,
      ),
    );
  }

  /// Loading overlay
  static Widget buildLoadingOverlay({
    required bool isLoading,
    required Widget child,
    String? loadingText,
  }) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black26,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildLoadingIndicator(),
                  if (loadingText != null) ...[
                    verticalSpacingM,
                    Text(
                      loadingText,
                      style: AppConstants.bodyTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }

  // ============ ERROR HELPERS ============

  /// Error widget
  static Widget buildErrorWidget({
    required String message,
    VoidCallback? onRetry,
    IconData? icon,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.error_outline,
          size: AppConstants.iconSizeXL,
          color: SemanticColors.state.error,
        ),
        verticalSpacingM,
        Text(
          message,
          style: AppConstants.bodyTextStyle,
          textAlign: TextAlign.center,
        ),
        if (onRetry != null) ...[
          verticalSpacingM,
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ],
    );
  }

  // ============ EMPTY STATE HELPERS ============

  /// Empty state widget
  static Widget buildEmptyState({
    required String message,
    IconData? icon,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.inbox_outlined,
          size: AppConstants.iconSizeXL * 1.5,
          color: SemanticColors.text.secondary,
        ),
        verticalSpacingM,
        Text(
          message,
          style: AppConstants.bodyTextStyle.copyWith(
            color: SemanticColors.text.secondary,
          ),
          textAlign: TextAlign.center,
        ),
        if (onAction != null && actionText != null) ...[
          verticalSpacingM,
          ElevatedButton(
            onPressed: onAction,
            child: Text(actionText),
          ),
        ],
      ],
    );
  }
}
