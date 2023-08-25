import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeoIconButton extends StatelessWidget {
  const NeoIconButton({
    super.key,
    this.size = 42.0,
    this.shape = BoxShape.circle,
    this.hapticFeedback = true,
    this.enabled = true,
    this.offset = const Offset(3, 3),
    this.shadowColor = Colors.black,
    this.backgroundColor,
    this.foregroundColor,
    this.onTap,
    required this.icon,
  });

  /// The size of the button.
  final double size;

  /// The shape of the button.
  final BoxShape shape;

  /// Whether to play haptic feedback when the button is tapped.
  final bool hapticFeedback;

  /// Whether the button is enabled.
  final bool enabled;

  /// The offset of the shadow.
  final Offset offset;

  /// The color of the shadow.
  final Color shadowColor;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The foreground color of the button.
  final Color? foregroundColor;

  /// The icon to display inside the button.
  final IconData icon;

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback? onTap;

  bool get _enabled => enabled && onTap != null;

  @override
  Widget build(BuildContext context) {
    void onTap() {
      if (hapticFeedback) {
        HapticFeedback.selectionClick();
      }

      this.onTap?.call();
    }

    return GestureDetector(
      onTap: _enabled ? () => onTap() : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
          shape: shape,
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
        child: Icon(
          icon,
          color: foregroundColor ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
