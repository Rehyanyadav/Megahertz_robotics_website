import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addOrder(Map<String, dynamic> order) async {
    await _db.collection('orders').add(order);
  }

  Future<List<Map<String, dynamic>>> getProjects() async {
    QuerySnapshot snapshot = await _db.collection('projects').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
