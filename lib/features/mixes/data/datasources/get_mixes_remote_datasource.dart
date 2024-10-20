
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sslmixes/core/common/network/dio_config.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_body.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_response.dart';

abstract class GetMixesRemoteDataSource {
  ///[getMixes] Call api to Get Home Views
  ///
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MixesResponse?> getMixes({required MixBody mixsearchparams});
}

@LazySingleton(as: GetMixesRemoteDataSource)
class GetMixesRemoteDataSourceImpl implements GetMixesRemoteDataSource {
  final DioClient _client;

  GetMixesRemoteDataSourceImpl(this._client);

  @override
  Future<MixesResponse?> getMixes({required MixBody mixsearchparams}) async {
    try {
      final response = await _client.get('/getmixes.php',
          queryParameters: mixsearchparams.toJson());
      if (kDebugMode) {
        print('Get Mixes response: $response');
      }

      final res = MixesResponse.fromJson(response);
      return res;
    } catch (e) {
      if (kDebugMode) {
        print('Post Transactions response: $e');
      }
      rethrow;
    }
  }
}
