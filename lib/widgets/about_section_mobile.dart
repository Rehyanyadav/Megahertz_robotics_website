import 'dart:async';
import 'package:flutter/material.dart';

class CarouselTimeline extends StatefulWidget {
  final List<TimelineEvent> events;
  final int itemsPerPage;

  const CarouselTimeline({
    super.key,
    required this.events,
    this.itemsPerPage = 3, // Default to 3 items per carousel page
  });

  @override
  State<CarouselTimeline> createState() => _CarouselTimelineState();
}

class _CarouselTimelineState extends State<CarouselTimeline> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Auto-scroll timer
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < _getTotalPages() - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset to the first page
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  int _getTotalPages() {
    return (widget.events.length / widget.itemsPerPage).ceil();
  }

  List<List<TimelineEvent>> _getEventSections() {
    List<List<TimelineEvent>> sections = [];
    for (int i = 0; i < widget.events.length; i += widget.itemsPerPage) {
      sections.add(widget.events.sublist(
        i,
        i + widget.itemsPerPage > widget.events.length
            ? widget.events.length
            : i + widget.itemsPerPage,
      ));
    }
    return sections;
  }

  @override
  Widget build(BuildContext context) {
    final eventSections = _getEventSections();

    return SizedBox(
      height: 400, // Fixed height for the carousel
      child: PageView.builder(
        controller: _pageController,
        itemCount: eventSections.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return TimelineSection(events: eventSections[index]);
        },
      ),
    );
  }
}

class TimelineEvent {
  final String year;
  final String description;

  TimelineEvent({required this.year, required this.description});
}

class TimelineSection extends StatelessWidget {
  final List<TimelineEvent> events;

  const TimelineSection({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return TimelineTile(
          event: events[index],
          isLast: index == events.length - 1,
        );
      },
    );
  }
}

class TimelineTile extends StatefulWidget {
  final TimelineEvent event;
  final bool isLast;

  const TimelineTile({super.key, required this.event, required this.isLast});

  @override
  State<TimelineTile> createState() => _TimelineTileState();
}

class _TimelineTileState extends State<TimelineTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: constraints.maxWidth > 600 ? 48.0 : 16.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Column for Indicator and Connector Line
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Blinking Glowing Indicator
                  FadeTransition(
                    opacity:
                        _blinkController.drive(Tween(begin: 0.5, end: 1.0)),
                    child: ScaleTransition(
                      scale:
                          _blinkController.drive(Tween(begin: 0.9, end: 1.1)),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.yellow.shade700.withOpacity(0.8),
                              Colors.yellow.shade700.withOpacity(0.5),
                              Colors.transparent,
                            ],
                            stops: const [0.2, 0.5, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow.shade700.withOpacity(0.7),
                              blurRadius: 20,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!widget.isLast)
                    // Glowing Connector Line
                    Container(
                      width: 2,
                      height: constraints.maxWidth > 600 ? 80 : 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow.shade700.withOpacity(0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.shade700.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              // Event Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.event.year,
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 20 : 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.event.description,
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 18 : 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
