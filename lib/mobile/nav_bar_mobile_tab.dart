import 'package:flutter/material.dart';

class NavbarMobileTab extends StatefulWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onmenuTap;

  const NavbarMobileTab({
    super.key,
    this.onLogoTap,
    this.onmenuTap,
  });

  @override
  State<NavbarMobileTab> createState() => _NavbarMobileTabState();
}

class _NavbarMobileTabState extends State<NavbarMobileTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isMenuOpen = false;

  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    const Color.fromARGB(255, 92, 59, 255),
    const Color.fromARGB(255, 54, 231, 244),
  ];

  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 40.0,
    fontFamily: 'Horizon',
  );

  TextStyle smallText = const TextStyle(
    fontSize: 25.0,
    fontFamily: 'Horizon',
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves
          .elasticOut, // Changed to elasticOut for smoother, bouncier animation
    ));
  }

  void _handleMenuTap() {
    setState(() {
      isMenuOpen = !isMenuOpen;
      if (isMenuOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onmenuTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      child: Row(
        children: [
          Image.asset('assets/logo.png', width: 100.0, height: 500.0),
          const Spacer(),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 3.14159, // Rotate 180 degrees
                child: IconButton(
                  onPressed: _handleMenuTap,
                  icon: const Icon(
                    Icons.menu,
                    size: 35,
                    color: Color.fromARGB(255, 255, 196, 0),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
