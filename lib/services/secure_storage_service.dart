import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user.dart';

abstract class ISecureStorageService {
  Future<User?> getLoggedUser();
}

class SecureStorageService implements ISecureStorageService {
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  @override
  Future<User?> getLoggedUser() async {
    String? userJson = await storage.read(key: 'user');

    if (userJson == null) {
      return null;
    }

    return User.fromJson(jsonDecode(userJson));
  }
}
