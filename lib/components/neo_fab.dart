import 'package:flutter/material.dart';

class NeoFab extends StatefulWidget {
  const NeoFab({
    super.key,
    this.expanded = false,
    this.text,
    this.icon,
    this.textStyle,
    this.duration = const Duration(milliseconds: 200),
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor = Colors.black,
    this.offset = const Offset(3, 3),
    this.borderRadius = 8.0,
  });

  /// Whether the [NeoFab] is expanded or not.
  final bool expanded;

  /// The text to display inside the container.
  final String? text;

  /// The icon to display inside the container.
  final IconData? icon;

  /// The [TextStyle] to apply to the text.
  final TextStyle? textStyle;

  /// The duration of the animation.
  final Duration duration;

  /// The callback to call when the [NeoFab] is pressed.
  final VoidCallback? onPressed;

  /// The color to fill the background of the container.
  final Color? backgroundColor;

  /// The color to fill the foreground of the container.
  final Color? foregroundColor;

  /// The color to fill the shadow of the container.
  final Color shadowColor;

  /// The offset of the shadow of the container.
  final Offset offset;

  /// The radius of the border of the container.
  final double borderRadius;

  @override
  State<NeoFab> createState() => _NeoFabState();
}

class _NeoFabState extends State<NeoFab> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  bool _expanded = false;

  @override
  void didUpdateWidget(covariant NeoFab old) {
    if (old.expanded != widget.expanded) {
      setState(() {
        _expanded = widget.expanded;
        _expanded ? _controller.forward() : _controller.reverse();
      });
    }
    super.didUpdateWidget(old);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    setState(() {
      _expanded = widget.expanded;
      _expanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.backgroundColor ??
              Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: widget.shadowColor,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor,
              offset: widget.offset,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: widget.foregroundColor ??
                      Theme.of(context).iconTheme.color,
                ),
              if (widget.text != null)
                SizeTransition(
                  sizeFactor: _animation,
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  child: Text(
                    widget.text!,
                    style: widget.textStyle ??
                        TextStyle(
                            color: widget.foregroundColor ??
                                Theme.of(context).iconTheme.color),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
