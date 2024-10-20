class ServerException implements Exception {
  final String errorMesage;

  ServerException({required this.errorMesage});
}

class CacheException implements Exception {}

class DatabaseException implements Exception {}

class HandShakeException implements ServerException {
  final String errorMesageHandshake;

  HandShakeException({required this.errorMesageHandshake});

  @override
  String get errorMesage => errorMesageHandshake;
}
