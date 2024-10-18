import 'dart:io';

import 'package:dio/dio.dart';

import 'base_repository.dart';

abstract class ICreateAccountRepository {
  Future<void> createIndividualAccount({
    required String fullname,
    required String doc,
    required String email,
    required String password,
    required String type,
    required String phone,
    File? avatar,
    required bool agreeTerms,
    bool member,
  });
}

class CreateAccountRepository extends BaseRepository
    implements ICreateAccountRepository {
  @override
  Future<void> createIndividualAccount({
    required String fullname,
    required String doc,
    required String email,
    required String password,
    required String type,
    required String phone,
    File? avatar,
    required bool agreeTerms,
    bool member = false,
  }) async {
    await dio.post(
      'API/Customer',
      data: FormData.fromMap({
        'fullname': fullname,
        'doc': doc,
        'email': email,
        'password': password,
        'type': type,
        'phone': phone,
        'avatar': avatar != null
            ? [
                await MultipartFile.fromFile(
                  avatar.path,
                  filename: avatar.path.split('/').last,
                )
              ]
            : null,
        'agreeterms': agreeTerms,
        'member': member,
        'action': 'register',
      }),
    );
  }
}
