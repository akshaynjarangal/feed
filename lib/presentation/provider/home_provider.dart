import 'package:feed/data/models/categories_model.dart';
import 'package:feed/data/models/home_data_model.dart';
import 'package:feed/domain/usecases/home_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeProvider extends ChangeNotifier {
  final HomeUseCase _homeUseCase;
  HomeProvider({required HomeUseCase homeUseCase}) : _homeUseCase = homeUseCase;

  HomeDataModel? _homeData;
  HomeDataModel? get homeData => _homeData;

  set setHomeData(HomeDataModel data) {
    _homeData = data;
    notifyListeners();
  }

  List<CategoriesModel> _categoriesData = [];

  List<CategoriesModel> get categoriesData => _categoriesData;

  set setCategoriesData(List<CategoriesModel> data) {
    _categoriesData = data;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isDataLoaded = false;
  bool get isDataLoaded => _isDataLoaded;

  set setDataLoaded(bool value) {
    _isDataLoaded = value;
    notifyListeners();
  }

  Future<void> getCategories() async {
    setLoading = true;
    final result = await _homeUseCase.homeCategories;
    result.fold(
      (error) {
        setDataLoaded = false;
        setLoading = false;
      },
      (data) {
        setCategoriesData = data;
        setDataLoaded = true;
        getHomeData();
      },
    );
  }

  Future<void> getHomeData() async {
    setLoading = true;
    final result = await _homeUseCase.homeData;
    result.fold(
      (error) {
        setDataLoaded = false;
        setLoading = false;
      },
      (data) {
        setHomeData = data;
        setDataLoaded = true;
        setLoading = false;
      },
    );
  }
}
