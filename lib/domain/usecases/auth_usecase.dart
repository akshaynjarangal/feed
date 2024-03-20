import 'package:dartz/dartz.dart';
import 'package:feed/data/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  

  Future<Either<String, String>> login(String phone) async {
    return await _authRepository.login(phone);
  }
}
