import 'package:dartz/dartz.dart';
import 'package:feed/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;

abstract class AddFeedRepository {
  Future<Either<String, String>> addFeed(String title, String description, String videoPath);
}

class AddFeedRepositoryImpl implements AddFeedRepository {
  @override
  Future<Either<String, String>> addFeed(String title, String description, String videoPath) async {
    try {
      final url = Uri.https(AppUrls.domain,AppUrls.myfeed);
      final res = await http.post(
        url,
        body: {
          "title": title,
          "description": description,
          "video": videoPath,
        },
      );
      if (res.statusCode == 202) {
        return Right(res.body);
      } else {
        return const Left("Failed to upload feed");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}