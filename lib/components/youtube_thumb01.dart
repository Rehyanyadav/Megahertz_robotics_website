import 'package:flutter/material.dart';

import 'youtube_thumbnail.dart';

class ThumbnailRow extends StatelessWidget {
  const ThumbnailRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ThumbnailCard(
            imagePath: 'assets/youtube/pic01.png',
            title: 'MegaHertz Robotics',
            description:
                'Music reactive LEDs || Sound sensor - Arduino Connections & Coding',
            action1Text: 'Watch Now',
            action2Text: 'Share',
          ),
          ThumbnailCard(
            imagePath: 'assets/youtube/pic02.png',
            title: 'MegaHertz Robotics',
            description:
                'How to make a wifi controlled car using Nodemcu ESP8266 and NEW Blynk App',
            action1Text: 'Watch Now',
            action2Text: 'Share',
          ),
          ThumbnailCard(
            imagePath: 'assets/youtube/pic03.png',
            title: 'MegaHertz Robotics',
            description:
                'My School Exhibition Project || Unmanned Surveillance Vehicle (U.S.V) ',
            action1Text: 'Watch Now',
            action2Text: 'Share',
          ),
          ThumbnailCard(
            imagePath: 'assets/youtube/pic04.png',
            title: 'MegaHertz Robotics',
            description:
                'GAS Leakage Detector using Arduino Nano / UNO || MQ5 Sensor ',
            action1Text: 'Watch Now',
            action2Text: 'Share',
          ),
        ],
      ),
    );
  }
}
