import 'package:dartz/dartz.dart';

abstract class AddFeedRepository {
  Future<Either<String, String>> addFeed(String title, String description, String videoPath);
}