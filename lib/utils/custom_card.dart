import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılacak atomik Card widget'ı.
class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double elevation;
  final Color? color;
  final ShapeBorder? shape;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.elevation = 4,
    this.color,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      shape: shape,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
