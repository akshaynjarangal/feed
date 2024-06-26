import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final navkey = GlobalKey<NavigatorState>();

class AppUrls {
  static const String domain = "frijo.noviindus.in";
  static const String basePath = "/api";
  static const String login = "$basePath/otp_verified";
  static const String categoryList = "$basePath/category_list";
  static const String home = "$basePath/home";
  static const String myfeed = "$basePath/my_feed";
}

const storage = FlutterSecureStorage();