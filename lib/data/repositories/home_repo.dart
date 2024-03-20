import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:feed/core/constants/app_constants.dart';
import 'package:feed/data/models/categories_model.dart';
import 'package:feed/data/models/home_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class HomeRepository {
  Future<Either<String, HomeDataModel>> getHomeData();
  Future<Either<String, List<CategoriesModel>>> getHomeCategories();
}

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<String, List<CategoriesModel>>> getHomeCategories() async {
    try {
      final url = Uri.https(AppUrls.domain, AppUrls.categoryList);
      final res = await http.get(url);
      if (res.statusCode == 202) {
        final decoded = jsonDecode(res.body)["categories"];
        log("RES CATEGORY---> ${res.body}");
        final decodedlist = categoriesModelFromJson(jsonEncode(decoded));
        return Right(decodedlist);
      } else {
        return const Left("Failed to fetch data");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, HomeDataModel>> getHomeData() async {
    try {
      final url = Uri.https(AppUrls.domain, AppUrls.home);
      final res = await http.get(url);
      if (res.statusCode == 202) {
        log("RES HOME---> ${res.body}");
        final decodedlist = homeDataModelFromJson(res.body);
        return Right(decodedlist);
      } else {
        return const Left("Failed to fetch data");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
