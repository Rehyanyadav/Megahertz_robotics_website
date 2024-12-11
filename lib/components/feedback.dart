import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


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
      comment:
          'Service is appreciatable, got quick response. The products are amazing and of great quality.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:55:33'),
    ),
    Feedback(
      userName: 'AKARSH RAJ',
      comment: 'Awesome.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:57:39'),
    ),
    Feedback(
      userName: 'Satyaki Seth',
      comment: 'Good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:57:49'),
    ),
    Feedback(
      userName: 'Bhavya Mishra',
      comment: 'Great service, products are of high quality.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 23:04:33'),
    ),
    Feedback(
      userName: 'Anish R',
      comment: 'All the products are awesome 😎.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 23:14:06'),
    ),
    Feedback(
      userName: 'RIDDHI KHANNA',
      comment: 'The customer service is amazing, and delivery is hassle-free!',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:07:09'),
    ),
    Feedback(
      userName: 'Adya Mishra',
      comment:
          'The product in question is exactly as advertised and is really worth the money.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:08:08'),
    ),
    Feedback(
      userName: 'Shruti Roy',
      comment: 'The product quality is consistently outstanding.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:09:14'),
    ),
    Feedback(
      userName: 'Aman Shekhar',
      comment: 'The product quality is exceeding my expectations every time.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:10:00'),
    ),
    Feedback(
      userName: 'Aditya Kumar',
      comment:
          'Had an amazing experience and the product was exactly what I was looking for.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:11:04'),
    ),
    Feedback(
      userName: 'Divya Sinha',
      comment: 'Products are great and services are also good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 01:16:58'),
    ),
    Feedback(
      userName: 'Ankit Singh',
      comment: 'Products are great and services are also good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 01:33:53'),
    ),
    Feedback(
      userName: 'Shreya Suman',
      comment: 'Feedback is very good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 01:41:44'),
    ),
    Feedback(
      userName: 'Bristy Roy',
      comment: 'Products and services are really good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 02:00:22'),
    ),
    Feedback(
      userName: 'Hardik Prasad',
      comment: 'Service is really good and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 09:12:26'),
    ),
    Feedback(
      userName: 'Gaurav Bhulania',
      comment: 'Service is really good and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 09:59:30'),
    ),
    Feedback(
      userName: 'Ashish Kumar',
      comment: 'Service is very good and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 12:55:47'),
    ),
    Feedback(
      userName: 'Rupali',
      comment: 'Service is great and have nice products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 13:02:04'),
    ),
    Feedback(
      userName: 'Abhinav Kr',
      comment: 'Service is nice and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 13:02:23'),
    ),
    Feedback(
      userName: 'Palak Sinha',
      comment: 'Service is very good and have nice products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 13:02:37'),
    ),
    Feedback(
      userName: 'Golu Kumar',
      comment: 'The service and product was too good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 20:56:15'),
    ),
    Feedback(
      userName: 'Rahul Kumar',
      comment: 'Both were too good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 20:57:01'),
    ),
    Feedback(
      userName: 'Muskan Bharti',
      comment: 'Very nice service.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 20:57:56'),
    ),
  ];

  FeedbackCard({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  feedback.userName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${feedback.date.day}/${feedback.date.month}/${feedback.date.year}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            RatingBarIndicator(
              rating: feedback.rating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 24.0,
            ),
            const SizedBox(height: 12),
            Text(
              feedback.comment,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
