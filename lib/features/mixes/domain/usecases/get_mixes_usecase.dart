import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sslmixes/core/common/error/failures.dart';
import 'package:sslmixes/core/common/usecases/usecase.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_body.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_response.dart';
import 'package:sslmixes/features/mixes/domain/repositories/get_mixes_repository.dart';

@lazySingleton
class GetMixesUseCase implements UseCase<MixesResponse?, MixBody> {
  final GetMixesRepository _dealsRepository;

  GetMixesUseCase(this._dealsRepository);

  @override
  Future<Either<Failure, MixesResponse?>> call(MixBody params) async {
    return await _dealsRepository.getMixes(mixsearchparams: params);
  }
}
