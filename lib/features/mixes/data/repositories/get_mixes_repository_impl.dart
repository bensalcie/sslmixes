import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sslmixes/core/common/error/exceptions.dart';
import 'package:sslmixes/core/common/error/failures.dart';
import 'package:sslmixes/features/mixes/data/datasources/get_mixes_remote_datasource.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_body.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_response.dart';
import 'package:sslmixes/features/mixes/domain/repositories/get_mixes_repository.dart';

@LazySingleton(as: GetMixesRepository)
class GetMixesRepositoryImpl implements GetMixesRepository {
  final GetMixesRemoteDataSource _getTransactionsRemoteDataSource;

  GetMixesRepositoryImpl(this._getTransactionsRemoteDataSource);

  @override
  Future<Either<Failure, MixesResponse?>> getMixes(
      {required MixBody mixsearchparams}) async {
    try {
      final response = await _getTransactionsRemoteDataSource.getMixes(
          mixsearchparams: mixsearchparams);

      return Right(response);
    } on ServerException catch (e) {
      bool isHandShake = e.errorMesage.contains('CERTIFICATE_VERIFY_FAILED');

      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(isHandShake ? HandShakeFailure() : ServerFailure());
    }
  }
}
