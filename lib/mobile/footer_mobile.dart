import 'package:flutter/material.dart';

class FooterMobile extends StatefulWidget {
  const FooterMobile({super.key});

  @override
  State<FooterMobile> createState() => _FooterMobileState();
}

class _FooterMobileState extends State<FooterMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/logo.png', width: 200, height: 200),
        const Text(
          'QUICK LINKS',
          style: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 255, 196, 0),
          ),
        ),
        const SizedBox(height: 4),
        const TextButton(
          onPressed: null,
          child: Text(
            'Wants to build projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const TextButton(
          onPressed: null,
          child: Text(
            'Participations/Achievements',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const TextButton(
          onPressed: null,
          child: Text(
            'Shop Components',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const TextButton(
          onPressed: null,
          child: Text(
            'Rentals',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'LEGAL',
          style: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 255, 196, 0),
          ),
        ),
        const SizedBox(height: 8),
        const TextButton(
          onPressed: null,
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const TextButton(
          onPressed: null,
          child: Text(
            'Terms of use',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const TextButton(
          onPressed: null,
          child: Text(
            'Refund & Cancellation Policy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'GET IN TOUCH',
          style: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 255, 196, 0),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'megahertzrobotics@gmail.com',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
