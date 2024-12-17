import 'package:version2/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'users';

  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection(collectionName).doc(uid).get();
      if (doc.exists) {
        final data = doc.data();
        if (data != null &&
            data.containsKey('name') &&
            data.containsKey('email')) {
          return UserModel.fromMap(data);
        } else {
          throw Exception("Invalid user data: Missing required fields.");
        }
      }
    } catch (error) {
      throw Exception("Failed to fetch user: $error");
    }
    return null;
  }
}
