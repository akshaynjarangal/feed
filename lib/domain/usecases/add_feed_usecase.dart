import 'package:dartz/dartz.dart';
import 'package:feed/data/repositories/add_feed_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddFeedUseCase {
  final AddFeedRepository _feedRepository;
  AddFeedUseCase({required AddFeedRepository feedRepository}) : _feedRepository = feedRepository;

  Future<Either<String,String>> uploadFeed() async {
    return await _feedRepository.addFeed("title", "description", "videoPath");
  }
  
}
