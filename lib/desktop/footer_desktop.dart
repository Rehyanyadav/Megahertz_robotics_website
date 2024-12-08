import 'package:flutter/material.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color.fromARGB(255, 0, 0, 0),
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
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: null,
                child: Text(
                  'Wants to build projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: null,
                child: Text(
                  'Participations/Achievements',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: null,
                child: Text(
                  'Shop Components',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: null,
                child: Text(
                  'Rentals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LEGAL',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: null,
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: null,
                child: Text(
                  'Terms of use',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: null,
                child: Text(
                  'Refund & Cancellation Policy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'megahertzrobotics@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
