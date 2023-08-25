import 'package:flutter/material.dart';

class NeoContainer extends StatelessWidget {
  const NeoContainer({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.black,
    this.offset = const Offset(3, 3),
    this.borderRadius = 8.0,
  });

  /// The [Widget] to display inside the container.
  final Widget child;

  /// The color to fill the background of the container.
  final Color? backgroundColor;

  /// The color to fill the shadow of the container.
  final Color shadowColor;

  /// The offset of the shadow of the container.
  final Offset offset;

  /// The radius of the border of the container.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: shadowColor,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
