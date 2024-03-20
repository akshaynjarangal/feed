import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:feed/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<Either<String, String>> login(String phone);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<String, String>> login(String phone) async {
    try {
      final url = Uri.https(AppUrls.domain, AppUrls.login);
      final res = await http.post(
        url,
        body: {
          "country_code": "+91",
          "phone": phone,
        },
      );
      if (res.statusCode == 200) {
        return Right(res.body);
      } else {
        final decoded = jsonDecode(res.body);
        return Left("${decoded["message"]}");
      }
    } catch (e) {
      return Future.value(Left(e.toString()));
    }
  }
}
