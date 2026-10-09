import 'package:flutter/foundation.dart';
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

  Future<String?> signInWithGoogle() async {
    try {
      await initialize();

      final GoogleSignInAccount user = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication auth = user.authentication;

      // Save user details securely
      await _storage.write(key: 'user_name', value: user.displayName ?? '');

      await _storage.write(key: 'user_email', value: user.email);

      await _storage.write(key: 'user_photo', value: user.photoUrl ?? '');

      // Save ID token if available
      if (auth.idToken != null) {
        await _storage.write(key: 'google_id_token', value: auth.idToken!);
      }

      return null;
    } catch (e) {
      debugPrint('Google Sign-In Error: $e');
      return e.toString();
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'google_id_token');
  }

  Future<String?> getUserEmail() async {
    return _storage.read(key: 'user_email');
  }

  Future<bool> hasSavedSession() async {
    try {
      final email = await getUserEmail();
      return email?.trim().isNotEmpty ?? false;
    } catch (e) {
      debugPrint('Could not restore saved session: $e');
      return false;
    }
  }

  Future<String?> getUserPhoto() async {
    return _storage.read(key: 'user_photo');
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _storage.deleteAll();
  }
}
