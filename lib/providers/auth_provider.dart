import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  bool _isAuthenticated = false;
  String? _email;

  bool get isAuthenticated => _isAuthenticated;
  String? get email => _email;

  Future<bool> signIn(String email, String password) async {
    try {
      // TODO: Implement actual authentication logic
      await _storage.write(key: 'email', value: email);
      _email = email;
      _isAuthenticated = true;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      // TODO: Implement actual registration logic
      await _storage.write(key: 'email', value: email);
      _email = email;
      _isAuthenticated = true;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    await _storage.delete(key: 'email');
    _email = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    _email = await _storage.read(key: 'email');
    _isAuthenticated = _email != null;
    notifyListeners();
  }
}