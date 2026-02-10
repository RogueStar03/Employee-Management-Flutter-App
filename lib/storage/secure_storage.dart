import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AmsSecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> setActiveTheme(String? id) async {
    await _storage.write(key: "active_theme_id", value: id);
  }

  Future<String?> getActiveTheme() async {
    return await _storage.read(key: "active_theme_id");
  }
}
