// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/auth_repo.dart' as _i3;
import '../data/repositories/home_repo.dart' as _i5;
import '../domain/usecases/auth_usecase.dart' as _i4;
import '../domain/usecases/home_usecase.dart' as _i6;
import '../presentation/provider/home_provider.dart' as _i8;
import '../presentation/provider/login_provider.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthRepository>(() => _i3.AuthRepositoryImpl());
    gh.factory<_i4.AuthUseCase>(
        () => _i4.AuthUseCase(authRepository: gh<_i3.AuthRepository>()));
    gh.lazySingleton<_i5.HomeRepository>(() => _i5.HomeRepositoryImpl());
    gh.factory<_i6.HomeUseCase>(
        () => _i6.HomeUseCase(homeRepository: gh<_i5.HomeRepository>()));
    gh.factory<_i7.LoginProvider>(
        () => _i7.LoginProvider(authUseCase: gh<_i4.AuthUseCase>()));
    gh.factory<_i8.HomeProvider>(
        () => _i8.HomeProvider(homeUseCase: gh<_i6.HomeUseCase>()));
    return this;
  }
}
