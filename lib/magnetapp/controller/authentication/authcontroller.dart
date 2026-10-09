import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GoogleAuthController {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    await _googleSignIn.initialize();
    _initialized = true;
  }

  Future<bool> signInWithGoogle() async {
    try {
      await initialize();

      final GoogleSignInAccount user =
          await _googleSignIn.authenticate();

      final GoogleSignInAuthentication auth =
          user.authentication;

      // Save user details securely
      await _storage.write(
        key: 'user_name',
        value: user.displayName ?? '',
      );

      await _storage.write(
        key: 'user_email',
        value: user.email,
      );

      await _storage.write(
        key: 'user_photo',
        value: user.photoUrl ?? '',
      );

      // Save ID token if available
      if (auth.idToken != null) {
        await _storage.write(
          key: 'google_id_token',
          value: auth.idToken!,
        );
      }

      return true;
    } catch (e) {
      print('Google Sign-In Error: $e');
      return false;
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'google_id_token');
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _storage.deleteAll();
  }
}