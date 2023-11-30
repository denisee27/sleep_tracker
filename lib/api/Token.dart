import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenAccess {
  static const storage = FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() {
    try {
      return storage.read(key: 'token');
    } catch (e) {
      throw Exception('Failed to get token');
    }
  }

  static Future<void> deleteToken() {
    try {
      return storage.delete(key: 'token');
    } catch (e) {
      throw Exception('Failed to get token');
    }
  }
}
