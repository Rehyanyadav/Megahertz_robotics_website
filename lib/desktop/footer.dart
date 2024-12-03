import 'package:flutter/material.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/logo.png', width: 200, height: 200),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QUICK LINKS',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              SizedBox(height: 8),
              Text('Wants to build projects'),
              SizedBox(height: 4),
              Text('Participations/Achievements'),
              SizedBox(height: 4),
              Text('Shop Components'),
              SizedBox(height: 4),
              Text('Rentals'),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LEGAL',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              SizedBox(height: 8),
              Text('Privacy Policy'),
              SizedBox(height: 4),
              Text('Terms of use'),
              SizedBox(height: 4),
              Text('Refund & Cancellation Policy'),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              SizedBox(height: 8),
              Text('megahertzrobotics@gmail.com'),
            ],
          ),
        ],
      ),
    );
  }
}
