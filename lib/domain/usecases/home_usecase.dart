import 'package:dartz/dartz.dart';
import 'package:feed/data/models/categories_model.dart';
import 'package:feed/data/models/home_data_model.dart';
import 'package:feed/data/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase {
  final HomeRepository _homeRepository;
  HomeUseCase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  Future<Either<String, HomeDataModel>> get homeData async =>
      await _homeRepository.getHomeData();

  Future<Either<String, List<CategoriesModel>>> get homeCategories async =>
      await _homeRepository.getHomeCategories();
}
