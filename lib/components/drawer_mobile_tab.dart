import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMobileTab extends StatelessWidget {
  const DrawerMobileTab({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.4),
                ],
              ),
              borderRadius: BorderRadius.zero,
            ),
            child: ListView(
              children: [
                // Close Button
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 187, 0),
                        )),
                  ),
                ),

                // Menu Items

                _buildMenuItem(
                  icon: Icons.shopping_cart_outlined,
                  title: 'Buy Products',
                  onTap: () {
                    // Navigation logic
                  },
                ),

                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'Custom Projects',
                  onTap: () {
                    // Navigation logic
                  },
                ),

                _buildMenuItem(
                  icon: Icons.book_sharp,
                  title: 'Tutorial',
                  onTap: () {
                    // Navigation logic
                  },
                ),

                const SizedBox(height: 30),

                // Social Media Buttons
                Row(
                  children: [
                    const SizedBox(width: 20),
                    const SizedBox(width: 10),
                    _socialMediaIcon(
                      icon: const SocialMediaButton.linkedin(
                        url: "https://www.linkedin.com/company/alphacodes101/",
                        size: 30,
                        color: Color.fromARGB(255, 0, 19, 194),
                      ),
                      url: "https://www.linkedin.com/company/alphacodes101/",
                    ),
                    const SizedBox(width: 10),
                    _socialMediaIcon(
                      icon: const SocialMediaButton.facebook(
                        url:
                            "https://www.facebook.com/profile.php?id=100077276373410&mibextid=JRoKGi",
                        size: 30,
                        color: Color.fromARGB(255, 4, 0, 255),
                      ),
                      url:
                          "https://www.facebook.com/profile.php?id=100077276373410&mibextid=JRoKGi",
                    ),
                    const SizedBox(width: 10),
                    _socialMediaIcon(
                      icon: const SocialMediaButton.youtube(
                        url: "https://www.youtube.com/@alphacodes8618",
                        size: 30,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      url: "https://www.youtube.com/@alphacodes8618",
                    ),
                    const SizedBox(width: 10),
                    _socialMediaIcon(
                      icon: const Icon(
                        FontAwesomeIcons.blogger,
                        color: Colors.orangeAccent,
                        size: 30,
                      ),
                      url:
                          '',
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Co.powered by AlphaCodes101',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create menu items
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          hoverColor: const Color.fromARGB(137, 255, 255, 255),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          leading: Icon(
            icon,
            size: 25,
            color: const Color.fromARGB(255, 255, 187, 0),
          ),
          title: Text(title),
          onTap: onTap,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  // Helper method to create social media icons with tap functionality
  Widget _socialMediaIcon({
    required Widget icon,
    required String url,
  }) {
    return InkWell(
      child: icon,
      onTap: () => _launchURL(url),
    );
  }
}
