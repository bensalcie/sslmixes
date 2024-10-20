// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/mixes/data/datasources/get_mixes_remote_datasource.dart'
    as _i1061;
import '../../../features/mixes/data/repositories/get_mixes_repository_impl.dart'
    as _i556;
import '../../../features/mixes/domain/repositories/get_mixes_repository.dart'
    as _i6;
import '../../../features/mixes/domain/usecases/get_mixes_usecase.dart'
    as _i639;
import '../../../features/mixes/presentation/bloc/get_mixes_bloc.dart'
    as _i706;
import '../network/dio_config.dart' as _i150;
import 'module_injection.dart' as _i237;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.factory<String>(
      () => registerModules.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i361.Dio>(
        () => registerModules.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i150.DioClient>(() => _i150.DioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i1061.GetMixesRemoteDataSource>(
        () => _i1061.GetMixesRemoteDataSourceImpl(gh<_i150.DioClient>()));
    gh.lazySingleton<_i6.GetMixesRepository>(() =>
        _i556.GetMixesRepositoryImpl(gh<_i1061.GetMixesRemoteDataSource>()));
    gh.lazySingleton<_i639.GetMixesUseCase>(
        () => _i639.GetMixesUseCase(gh<_i6.GetMixesRepository>()));
    gh.factory<_i706.GetMixesBloc>(
        () => _i706.GetMixesBloc(gh<_i639.GetMixesUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i237.RegisterModules {}
