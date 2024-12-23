// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TimelineSectionDesktop extends StatefulWidget {
  final List<TimelineEventDesktop> events;

  const TimelineSectionDesktop({super.key, required this.events});

  @override
  State<TimelineSectionDesktop> createState() => _TimelineSectionDesktopState();
}

class _TimelineSectionDesktopState extends State<TimelineSectionDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant TimelineSectionDesktop oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.events != widget.events) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.events.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            key: ValueKey(widget.events[index]), // Add a unique key
            animation: _controller,
            builder: (context, child) {
              final slideAnimation = Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    index * 0.2,
                    1.0,
                    curve: Curves.easeOut,
                  ),
                ),
              );

              return SlideTransition(
                position: slideAnimation,
                child: TimelineTileDesktop(
                  event: widget.events[index],
                  isLast: index == widget.events.length - 1,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TimelineEventDesktop {
  final String year;
  final String description;

  TimelineEventDesktop({required this.year, required this.description});
}

class TimelineTileDesktop extends StatelessWidget {
  final TimelineEventDesktop event;
  final bool isLast;

  const TimelineTileDesktop(
      {super.key, required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column: Timeline Indicator with Glowing Effect
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 209, 24),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 255, 209, 24)
                        .withOpacity(0.7),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyanAccent.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 16),

        // Right column: Year and Description
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.year,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 209, 24),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  event.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
