import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _socialMediaIcon({
    required Widget icon,
    required String url,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
        border: Border.all(color: Colors.yellow),
      ),
      child: InkWell(
        child: icon,
        onTap: () => _launchURL(url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/logo.png', width: 200, height: 200),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'QUICK LINKS',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () async {
                  // Open link action
                  final Uri url = Uri.parse(
                      'https://alphacodes101.github.io/megahertz_ordering_system/');

                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text(
                  'Buy Products',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 196, 0),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _socialMediaIcon(
                    icon: const Icon(
                      Icons.email,
                      size: 45,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    url: "mailto:megahertzrobotics@gmail.com",
                  ),
                  const SizedBox(width: 10),
                  _socialMediaIcon(
                    icon: const SocialMediaButton.linkedin(
                      url:
                          "https://www.linkedin.com/company/megahertz-robotics",
                      size: 30,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    url: "https://www.linkedin.com/company/megahertz-robotics",
                  ),
                  const SizedBox(width: 10),
                  _socialMediaIcon(
                    icon: const SocialMediaButton.facebook(
                      url:
                          "https://www.facebook.com/profile.php?id=100077276373410&mibextid=JRoKGi",
                      size: 30,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    url:
                        "https://www.facebook.com/profile.php?id=100077276373410&mibextid=JRoKGi",
                  ),
                  const SizedBox(width: 10),
                  _socialMediaIcon(
                    icon: const SocialMediaButton.youtube(
                      url: "https://www.youtube.com/c/TechieLagan",
                      size: 30,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    url: "https://www.youtube.com/c/TechieLagan",
                  ),
                  const SizedBox(width: 10),
                  _socialMediaIcon(
                    icon: const SocialMediaButton.instagram(
                      url:
                          "https://www.instagram.com/megahertz_robotics/p/DCxAuknTHtZ/",
                      size: 30,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    url:
                        "https://www.instagram.com/megahertz_robotics/p/DCxAuknTHtZ/",
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
