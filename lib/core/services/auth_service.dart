import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }

  Future<String?> getCurrentUserToken() async {
    return await _auth.currentUser?.getIdToken();
  }

  bool get isAuthenticated => _auth.currentUser != null;
}
