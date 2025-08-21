/*
 * CUSTOM WIDGETS - Özel Widget Kütüphanesi
 * 
 * Uygulama genelinde kullanılan tüm custom widget'ları içerir.
 * Semantic colors ve string constants kullanır.
 * Enum-driven design pattern ile tip güvenliği sağlar.
 */

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/semantic_colors.dart';

/// Widget türleri için enum'lar
enum ButtonIntent { primary, secondary, success, error, warning, info }
enum ButtonSize { small, medium, large }
enum CardIntent { standard, result, stat, info, warning, error }
enum TextIntent { heading, title, body, caption, score }

/// Custom Button Widget'ları
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonIntent intent;
  final ButtonSize size;
  final Color? customBackgroundColor;
  final Color? customTextColor;
  final IconData? icon;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.intent = ButtonIntent.primary,
    this.size = ButtonSize.medium,
    this.customBackgroundColor,
    this.customTextColor,
    this.icon,
    this.isLoading = false,
  });

  /// Primary button - ana işlemler için
  factory CustomButton.primary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      key: key,
      text: text,
      onPressed: onPressed,
      intent: ButtonIntent.primary,
      size: size,
      icon: icon,
      isLoading: isLoading,
    );
  }

  /// Secondary button - ikincil işlemler için
  factory CustomButton.secondary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      key: key,
      text: text,
      onPressed: onPressed,
      intent: ButtonIntent.secondary,
      size: size,
      icon: icon,
      isLoading: isLoading,
    );
  }

  /// Success button - başarılı işlemler için
  factory CustomButton.success({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      key: key,
      text: text,
      onPressed: onPressed,
      intent: ButtonIntent.success,
      size: size,
      icon: icon,
      isLoading: isLoading,
    );
  }

  /// Error button - hata durumları için
  factory CustomButton.error({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    IconData? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      key: key,
      text: text,
      onPressed: onPressed,
      intent: ButtonIntent.error,
      size: size,
      icon: icon,
      isLoading: isLoading,
    );
  }

  /// Quiz-specific button factories
  factory CustomButton.backToMenu({
    Key? key,
    VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
  }) {
    return CustomButton.primary(
      key: key,
      text: AppConstants.strings.backToMenu,
      onPressed: onPressed,
      size: size,
      icon: Icons.home,
      isLoading: isLoading,
    );
  }

  factory CustomButton.tryAgain({
    Key? key,
    VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    Color? scoreColor,
    bool isLoading = false,
  }) {
    return CustomButton(
      key: key,
      text: AppConstants.strings.tryAgain,
      onPressed: onPressed,
      intent: ButtonIntent.info,
      size: size,
      customBackgroundColor: scoreColor,
      customTextColor: SemanticColors.text.inverse,
      icon: Icons.refresh,
      isLoading: isLoading,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonTheme = _getButtonTheme();
    final buttonHeight = _getButtonHeight();

    return SizedBox(
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: customBackgroundColor ?? buttonTheme.backgroundColor,
          foregroundColor: customTextColor ?? buttonTheme.textColor,
          disabledBackgroundColor: SemanticColors.interactive.buttonDisabled,
          disabledForegroundColor: SemanticColors.text.disabled,
          padding: AppConstants.paddingHorizontalL,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.borderRadiusM,
          ),
          elevation: AppConstants.elevationM,
        ),
        child: isLoading
            ? SizedBox(
                height: AppConstants.iconSizeS,
                width: AppConstants.iconSizeS,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    customTextColor ?? buttonTheme.textColor,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: AppConstants.iconSizeM),
                    SizedBox(width: AppConstants.spacingS),
                  ],
                  Text(
                    text,
                    style: AppConstants.buttonTextStyle.copyWith(
                      color: customTextColor ?? buttonTheme.textColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  ButtonTheme _getButtonTheme() {
    switch (intent) {
      case ButtonIntent.primary:
        return ButtonTheme(
          backgroundColor: SemanticColors.interactive.buttonPrimary,
          textColor: SemanticColors.text.onPrimary,
        );
      case ButtonIntent.secondary:
        return ButtonTheme(
          backgroundColor: SemanticColors.interactive.buttonSecondary,
          textColor: SemanticColors.text.onSecondary,
        );
      case ButtonIntent.success:
        return ButtonTheme(
          backgroundColor: SemanticColors.interactive.buttonSuccess,
          textColor: SemanticColors.text.success,
        );
      case ButtonIntent.error:
        return ButtonTheme(
          backgroundColor: SemanticColors.interactive.buttonError,
          textColor: SemanticColors.text.error,
        );
      case ButtonIntent.warning:
        return ButtonTheme(
          backgroundColor: SemanticColors.state.warning,
          textColor: SemanticColors.text.warning,
        );
      case ButtonIntent.info:
        return ButtonTheme(
          backgroundColor: SemanticColors.state.info,
          textColor: SemanticColors.text.info,
        );
    }
  }

  double _getButtonHeight() {
    switch (size) {
      case ButtonSize.small:
        return AppConstants.buttonHeightS;
      case ButtonSize.medium:
        return AppConstants.buttonHeightM;
      case ButtonSize.large:
        return AppConstants.buttonHeightL;
    }
  }
}

/// Custom Card Widget'ları
class CustomCard extends StatelessWidget {
  final Widget child;
  final CardIntent intent;
  final double? elevation;
  final EdgeInsets? padding;
  final Color? customBackgroundColor;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.child,
    this.intent = CardIntent.standard,
    this.elevation,
    this.padding,
    this.customBackgroundColor,
    this.onTap,
  });

  /// Standard card - genel kullanım için
  factory CustomCard.standard({
    Key? key,
    required Widget child,
    EdgeInsets? padding,
    VoidCallback? onTap,
  }) {
    return CustomCard(
      key: key,
      child: child,
      intent: CardIntent.standard,
      padding: padding,
      onTap: onTap,
    );
  }

  /// Result card - sonuç ekranları için
  factory CustomCard.result({
    Key? key,
    required Widget child,
    EdgeInsets? padding,
    VoidCallback? onTap,
  }) {
    return CustomCard(
      key: key,
      child: child,
      intent: CardIntent.result,
      padding: padding,
      onTap: onTap,
    );
  }

  /// Stat card - istatistik gösterimi için
  factory CustomCard.stat({
    Key? key,
    required Widget child,
    EdgeInsets? padding,
    VoidCallback? onTap,
  }) {
    return CustomCard(
      key: key,
      child: child,
      intent: CardIntent.stat,
      padding: padding,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardTheme = _getCardTheme();
    final cardElevation = elevation ?? cardTheme.elevation;
    final cardPadding = padding ?? cardTheme.padding;
    final cardColor = customBackgroundColor ?? cardTheme.backgroundColor;

    Widget cardWidget = Card(
      elevation: cardElevation,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppConstants.borderRadiusM,
      ),
      child: Padding(
        padding: cardPadding,
        child: child,
      ),
    );

    if (onTap != null) {
      cardWidget = InkWell(
        onTap: onTap,
        borderRadius: AppConstants.borderRadiusM,
        child: cardWidget,
      );
    }

    return cardWidget;
  }

  CardTheme _getCardTheme() {
    switch (intent) {
      case CardIntent.standard:
        return CardTheme(
          backgroundColor: SemanticColors.surface.card,
          elevation: AppConstants.elevationM,
          padding: AppConstants.paddingM,
        );
      case CardIntent.result:
        return CardTheme(
          backgroundColor: SemanticColors.surface.cardElevated,
          elevation: AppConstants.elevationL,
          padding: AppConstants.paddingL,
        );
      case CardIntent.stat:
        return CardTheme(
          backgroundColor: SemanticColors.surface.card,
          elevation: AppConstants.elevationS,
          padding: AppConstants.paddingM,
        );
      case CardIntent.info:
        return CardTheme(
          backgroundColor: SemanticColors.state.infoLight,
          elevation: AppConstants.elevationM,
          padding: AppConstants.paddingM,
        );
      case CardIntent.warning:
        return CardTheme(
          backgroundColor: SemanticColors.state.warningLight,
          elevation: AppConstants.elevationM,
          padding: AppConstants.paddingM,
        );
      case CardIntent.error:
        return CardTheme(
          backgroundColor: SemanticColors.state.errorLight,
          elevation: AppConstants.elevationM,
          padding: AppConstants.paddingM,
        );
    }
  }
}

/// Custom Text Widget'ları
class CustomText extends StatelessWidget {
  final String text;
  final TextIntent intent;
  final Color? customColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    this.intent = TextIntent.body,
    this.customColor,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  /// Factory constructors with semantic meanings
  factory CustomText.heading({
    Key? key,
    required String text,
    Color? customColor,
    TextAlign? textAlign,
  }) {
    return CustomText(
      key: key,
      text: text,
      intent: TextIntent.heading,
      customColor: customColor,
      textAlign: textAlign,
    );
  }

  factory CustomText.title({
    Key? key,
    required String text,
    Color? customColor,
    TextAlign? textAlign,
  }) {
    return CustomText(
      key: key,
      text: text,
      intent: TextIntent.title,
      customColor: customColor,
      textAlign: textAlign,
    );
  }

  factory CustomText.body({
    Key? key,
    required String text,
    Color? customColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return CustomText(
      key: key,
      text: text,
      intent: TextIntent.body,
      customColor: customColor,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory CustomText.caption({
    Key? key,
    required String text,
    Color? customColor,
    TextAlign? textAlign,
  }) {
    return CustomText(
      key: key,
      text: text,
      intent: TextIntent.caption,
      customColor: customColor,
      textAlign: textAlign,
    );
  }

  factory CustomText.score({
    Key? key,
    required String text,
    Color? customColor,
    TextAlign? textAlign,
  }) {
    return CustomText(
      key: key,
      text: text,
      intent: TextIntent.score,
      customColor: customColor,
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = _getTextStyle();
    final semanticColor = customColor ?? _getSemanticColor();

    return Text(
      text,
      style: textStyle.copyWith(color: semanticColor),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getTextStyle() {
    switch (intent) {
      case TextIntent.heading:
        return AppConstants.headingTextStyle;
      case TextIntent.title:
        return AppConstants.titleTextStyle;
      case TextIntent.body:
        return AppConstants.bodyTextStyle;
      case TextIntent.caption:
        return AppConstants.captionTextStyle;
      case TextIntent.score:
        return AppConstants.scoreTextStyle;
    }
  }

  Color _getSemanticColor() {
    switch (intent) {
      case TextIntent.heading:
        return SemanticColors.text.primary;
      case TextIntent.title:
        return SemanticColors.text.primary;
      case TextIntent.body:
        return SemanticColors.text.primary;
      case TextIntent.caption:
        return SemanticColors.text.secondary;
      case TextIntent.score:
        return SemanticColors.text.inverse;
    }
  }
}

/// Score Circle Widget - skor gösterimi için özel widget
class ScoreCircle extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final double percentage;
  final double size;

  const ScoreCircle({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.percentage,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    final scoreColor = _getScoreColor();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppConstants.scoreGradient(scoreColor),
        boxShadow: [
          BoxShadow(
            color: scoreColor.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText.score(text: '$score'),
          CustomText.body(
            text: AppConstants.strings.outOf(score, totalQuestions),
            customColor: SemanticColors.text.inverse.withOpacity(0.9),
          ),
          CustomText.score(
            text: AppConstants.strings.percentageFormat(percentage),
          ),
        ],
      ),
    );
  }

  Color _getScoreColor() {
    if (percentage >= 90) return SemanticColors.state.excellent;
    if (percentage >= 70) return SemanticColors.state.good;
    if (percentage >= 50) return SemanticColors.state.average;
    return SemanticColors.state.poor;
  }
}

// ============ HELPER CLASSES ============

class ButtonTheme {
  final Color backgroundColor;
  final Color textColor;

  ButtonTheme({
    required this.backgroundColor,
    required this.textColor,
  });
}

class CardTheme {
  final Color backgroundColor;
  final double elevation;
  final EdgeInsets padding;

  CardTheme({
    required this.backgroundColor,
    required this.elevation,
    required this.padding,
  });
}
