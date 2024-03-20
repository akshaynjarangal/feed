import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {

  final List<String> _categories = ["Explore", "Trending", "All Categories", "Physics","Chemistry"];
  List<String> get categories => _categories;

  String _selectedCategory = "Explore";
  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}