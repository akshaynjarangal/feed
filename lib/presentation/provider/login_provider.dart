import 'dart:convert';

import 'package:feed/core/constants/app_constants.dart';
import 'package:feed/domain/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginProvider extends ChangeNotifier {
  final AuthUseCase _authUseCase;
  LoginProvider({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  set setLoginSuccess(bool value) {
    _isLoginSuccess = value;
    notifyListeners();
  }

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  set setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  void reset() {
    _isLoading = false;
    _isLoginSuccess = false;
    _errorMessage = "";
    notifyListeners();
  }

  TextEditingController phoneController =
      TextEditingController(text: '8129466718');

  Future<void> login() async {
    setLoading = true;
    final result = await _authUseCase.login(phoneController.text);
    result.fold(
      (error) {
        setErrorMessage = error;
        setLoading = false;
      },
      (data)async {
        final decoded = jsonDecode(data);
        await storage.write(key: "token", value: "${decoded["token"]["access"]}");
        setLoginSuccess = true;
        setLoading = false;
      },
    );
  }
}
