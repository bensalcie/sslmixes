import 'package:dartz/dartz.dart';
import 'package:sslmixes/core/common/error/failures.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_body.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_response.dart';


abstract class GetMixesRepository {
  /// Get HomeViewElements
  /// [getMixes]
  Future<Either<Failure, MixesResponse?>> getMixes(
      {required MixBody mixsearchparams});
}
