import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user.dart';

abstract class ISecureStorageService {
  Future<User?> getLoggedUser();
  Future<void> saveUser(User user);
}

class SecureStorageService implements ISecureStorageService {
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static String userKey = 'user';

  @override
  Future<User?> getLoggedUser() async {
    String? userJson = await storage.read(key: userKey);

    if (userJson == null) {
      return null;
    }

    return User.fromJson(jsonDecode(userJson));
  }

  @override
  Future<void> saveUser(User user) async {
    await storage.write(key: userKey, value: jsonEncode(user.toJson()));
  }
}
