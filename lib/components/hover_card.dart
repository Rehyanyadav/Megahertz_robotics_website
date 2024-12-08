import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final Color defaultColor;
  final Color hoverColor;
  final double defaultElevation;
  final double hoverElevation;

  const HoverCard({
    super.key,
    required this.child,
    this.width = 200,
    this.height = 150,
    this.defaultColor = Colors.white,
    this.hoverColor = Colors.blue,
    this.defaultElevation = 2,
    this.hoverElevation = 8,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        child: Card(
          elevation: isHovered ? widget.hoverElevation : widget.defaultElevation,
          color: isHovered ? widget.hoverColor : widget.defaultColor,
          child: widget.child,
        ),
      ),
    );
  }
}
