import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marquee/marquee.dart';

class Feedback {
  final String userName;
  final String comment;
  final double rating;
  final DateTime date;

  Feedback({
    required this.userName,
    required this.comment,
    required this.rating,
    required this.date,
  });
}

class FeedbackCard extends StatelessWidget {
  final Feedback feedback;

  const FeedbackCard({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        width:
            280, // Fixed width for each card to keep them aligned horizontally
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar or User Initial
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 24,
              child: Text(
                feedback.userName[0],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 12),

            // User Name
            Text(
              feedback.userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Comment
            Text(
              feedback.comment,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Date
            Text(
              '${feedback.date.day}/${feedback.date.month}/${feedback.date.year}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Rating
            RatingBarIndicator(
              rating: feedback.rating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackListMarquee extends StatelessWidget {
  final List<Feedback> feedbackList = [
    Feedback(
      userName: 'Prateek Priyanshu',
      comment: 'Excellent delivery and service.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:52:33'),
    ),
    Feedback(
      userName: 'Naiza Fatma',
      comment: 'Nice.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:53:25'),
    ),
    Feedback(
      userName: 'S.Pradhan',
      comment: 'The product was good up to the mark.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:54:23'),
    ),
    Feedback(
      userName: 'Awi Kumari',
      comment: 'Service is appreciable, got quick response.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:55:33'),
    ),
    Feedback(
      userName: 'AKARSH RAJ',
      comment: 'Awesome.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:57:39'),
    ),
  ];

  FeedbackListMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Feedback'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Marquee for Feedback Cards
            SizedBox(
              height: 180, // Adjust height for visibility
              child: Marquee(
                text: feedbackList
                    .map((feedback) =>
                        "${feedback.userName}: ${feedback.comment} (Rating: ${feedback.rating})  •  ")
                    .join(" "),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 50.0,
                velocity: 40.0,
                pauseAfterRound: const Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: const Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: const Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            // Row of Feedback Cards
            SizedBox(
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: feedbackList
                      .map((feedback) => FeedbackCard(feedback: feedback))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
